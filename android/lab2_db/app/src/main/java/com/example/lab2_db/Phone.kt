package com.example.lab2_db

import android.app.Application
import android.content.Context
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.room.ColumnInfo
import androidx.room.Dao
import androidx.room.Database
import androidx.room.Entity
import androidx.room.Insert
import androidx.room.OnConflictStrategy.Companion.ABORT
import androidx.room.PrimaryKey
import androidx.room.Query
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.sqlite.db.SupportSQLiteDatabase
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors

@Entity(tableName = "phones")
data class Phone (
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val manufacturer: String,
    val model: String,
    @ColumnInfo(name = "android_version")
    val androidVersion: String,
    val website: String
)

@Dao
interface PhoneDao {
    @Insert(onConflict = ABORT)
    fun insert(phone: Phone)

    @Query("DELETE FROM phones")
    fun deleteAll()

    @Query("SELECT * FROM phones ORDER BY manufacturer, model ASC")
    fun getAlphabetizedPhones(): LiveData<List<Phone>>
}

@Database(entities = [Phone::class], version = 1, exportSchema = false )
abstract class PhoneRoomDatabase : RoomDatabase() {
    abstract fun phoneDao(): PhoneDao

    companion object {
        // volatile variable is never cached - is always up to date for all threads
        @Volatile
        private var Instance: PhoneRoomDatabase? = null
        private const val NUMBER_OF_THREADS = 4
        val databaseWriteExecutor: ExecutorService = Executors.newFixedThreadPool(NUMBER_OF_THREADS)

        fun getDatabase(context: Context): PhoneRoomDatabase {
            // synchronized - only 1 thread can execute the block of code at a time
            return Instance ?: synchronized(this) {
                Room.databaseBuilder(context, PhoneRoomDatabase::class.java, "phone_db")
                    .addCallback(roomDatabaseCallback)
                    .fallbackToDestructiveMigration()
                    .build()
                    .also { Instance = it }
            }
        }

        private val roomDatabaseCallback = object :  Callback() {
            override fun onCreate(db: SupportSQLiteDatabase) {
                super.onCreate(db)

                databaseWriteExecutor.execute {
                    Instance?.let { nnInstance ->
                        var dao = nnInstance.phoneDao()

                        val phones = listOf (
                            Phone(manufacturer = "Google", model = "Pixel 9", androidVersion = "14", website = "www.example.com"),
                            Phone(manufacturer = "Google", model = "Pixel 9 Pro", androidVersion = "14", website = "www.example.com"),
                            Phone(manufacturer = "Google", model = "Pixel 9 Pro XL", androidVersion = "14", website = "www.example.com"),
                            Phone(manufacturer = "Google", model = "Pixel 9a", androidVersion = "14", website = "www.example.com")
                        )

                        phones.forEach { dao.insert(it) }
                    }
                }
            }
        }
    }
}

class PhoneRepository (application: Application) {
    val phoneRoomDatabase = PhoneRoomDatabase.getDatabase(application)
    val phoneDao = phoneRoomDatabase.phoneDao()
    val allPhones = phoneDao.getAlphabetizedPhones()
        private set

    fun getAllPhones(): LiveData<List<Phone>> {
        return allPhones
    }

    fun deleteAll() {
        PhoneRoomDatabase.databaseWriteExecutor.execute {
            phoneDao.deleteAll()
        }
    }
}

class PhoneViewModel(application: Application) : AndroidViewModel (application = application) {
    private val repository = PhoneRepository(application)
    val allPhones = repository.allPhones
        private set

    fun deleteAll() {
        repository.deleteAll()
    }
}
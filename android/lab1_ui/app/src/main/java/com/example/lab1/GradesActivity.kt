package com.example.lab1

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.lab1.databinding.ActivityGradesBinding

class GradesActivity : AppCompatActivity() {
    private lateinit var binding: ActivityGradesBinding
    var gradeList = ArrayList<Grade>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()

        binding = ActivityGradesBinding.inflate(layoutInflater)

        setContentView(binding.root)

        val subjectArray = resources.getStringArray(R.array.subject_array)
        val gradesNumber = intent.getIntExtra("gradesNumber", 0)

        if (savedInstanceState != null) {
            gradeList = savedInstanceState.getSerializable("gradeList") as? ArrayList<Grade> ?: ArrayList<Grade>()
        } else {
            for (i in 0..<gradesNumber) {
                gradeList.add(Grade(subjectArray[i], null))
            }
        }

        Log.d("GradesActivity", "gradesNumber: $gradesNumber")
        Log.d("GradesActivity", "list size: ${gradeList.size}")


        binding.gradesRecyclerView.layoutManager = LinearLayoutManager(this)
        binding.gradesRecyclerView.adapter = GradesAdapter(gradeList, layoutInflater)

        binding.gradesToolbar.setNavigationOnClickListener {
            setResult(RESULT_CANCELED)
            finish()
        }

        binding.calculateAvgButton.setOnClickListener {
            var avg = 0.0
            for (grade in gradeList) {
                if (grade.grade == null) {
                    Toast.makeText(this, "Musisz uzupełnić wszystkie pola!", Toast.LENGTH_SHORT).show()
                    // TODO: set error on empty radioGroups?
                    return@setOnClickListener
                }
                avg += grade.grade
            }
            avg /= gradeList.size

            val resultIntent = Intent().apply {
                putExtra("average", avg)
            }
            setResult(RESULT_OK, resultIntent)
            finish()
        }
    }

    override fun onSaveInstanceState(outState: Bundle) {
        val gradesNumber = intent.getIntExtra("gradesNumber", 0)

        outState.putInt("gradesNumber", gradesNumber)
        outState.putSerializable("gradeList", gradeList)
        super.onSaveInstanceState(outState)
    }
}
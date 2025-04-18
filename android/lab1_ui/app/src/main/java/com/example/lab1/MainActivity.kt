package com.example.lab1

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.activity.result.ActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import androidx.core.widget.doAfterTextChanged
import com.example.lab1.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding

    enum class ButtonState {
        CALCULATE,
        PASSED,
        FAILED
    }

    private lateinit var buttonState: ButtonState

    val activityLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result: ActivityResult ->
        if (result.resultCode == RESULT_OK) {
            val gradesAverage = result.data?.getDoubleExtra("average", 0.0)

            Log.d("MainActivity", "average: $gradesAverage")
            binding.averageGradeTextView.text = resources.getString(R.string.average_grade_message, gradesAverage)

            gradesAverage?.let {
                if (it >= 3) {
                    buttonState = ButtonState.PASSED
                    binding.gradesButton.text = getString(R.string.passedButtonText)
                }
                else {
                    buttonState = ButtonState.FAILED
                    binding.gradesButton.text = getString(R.string.failedButtonText)
                }
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()

        binding = ActivityMainBinding.inflate(layoutInflater)
        val view = binding.root
        setContentView(view)

        binding.firstNameEdit.setOnFocusChangeListener { _, hasFocus ->
            if (!hasFocus) {
                var firstname = binding.firstNameEdit.text.toString()
                if (firstname.isEmpty()) {
                    binding.firstNameEdit.error = "Imię nie może być puste"
                    Toast.makeText(this, "Musisz podać imię", Toast.LENGTH_SHORT).show()
                }
            }
        }

        binding.lastNameEdit.setOnFocusChangeListener { _, hasFocus ->
            if (!hasFocus) {
                var lastname = binding.lastNameEdit.text.toString()
                if (lastname.isEmpty()) {
                    binding.lastNameEdit.error = "Nazwisko nie może być puste"
                    Toast.makeText(this, "Musisz podać nazwisko", Toast.LENGTH_SHORT).show()
                }
            }
        }

        binding.gradesEdit.setOnFocusChangeListener { _, hasFocus ->
            if (!hasFocus) {
                val grades = binding.gradesEdit.text.toString().toIntOrNull()

                when (grades) {
                    null -> {
                        binding.gradesEdit.error = "Wartość musi być liczbą całkowitą!"
                        Toast.makeText(this, "Wartość musi być liczbą całkowitą!", Toast.LENGTH_SHORT).show()
                    }
                    in 5..15 -> {
                        binding.gradesEdit.error = null
                    }
                    else -> {
                        binding.gradesEdit.error = "Wartość musi być w przedziale [5; 15]"
                        Toast.makeText(this, "Wartość musi zawierać się w przedziale [5; 15]", Toast.LENGTH_SHORT).show()
                    }
                }
            }
        }

        binding.firstNameEdit.doAfterTextChanged {
            if (binding.firstNameEdit.text.toString().isNotEmpty()) {
                binding.firstNameEdit.error = null
            }
            checkButtonCondition()
        }

        binding.lastNameEdit.doAfterTextChanged {
            if (binding.lastNameEdit.text.toString().isNotEmpty()) {
                binding.lastNameEdit.error = null
            }
            checkButtonCondition()
        }
        binding.gradesEdit.doAfterTextChanged {
            val grade = binding.gradesEdit.text.toString().toIntOrNull()
            if (grade != null && grade in 5..15) {
                binding.gradesEdit.error = null
            }
            checkButtonCondition()
        }


        // TODO: button should appear above keyboard
        buttonState = savedInstanceState?.getSerializable("buttonState") as? ButtonState ?: ButtonState.CALCULATE

        binding.gradesButton.text = when (buttonState) {
            ButtonState.CALCULATE -> getString(R.string.gradesButtonText)
            ButtonState.PASSED -> getString(R.string.passedButtonText)
            ButtonState.FAILED -> getString(R.string.failedButtonText)
        }
        binding.gradesButton.setOnClickListener {
            when (buttonState) {
                ButtonState.CALCULATE -> {
                    val intent = Intent(this, GradesActivity::class.java)
                    var gradesInt = binding.gradesEdit.text.toString().toInt()
                    intent.putExtra("gradesNumber", gradesInt)

                    activityLauncher.launch(intent)
                }
                ButtonState.PASSED -> {
                    Toast.makeText(this, "Gratulacje! Otrzymujesz zaliczenie!", Toast.LENGTH_SHORT).show()
                    finish()
                }
                ButtonState.FAILED -> {
                    Toast.makeText(this, "Wysyłam podanie o zaliczenie warunkowe", Toast.LENGTH_SHORT).show()
                    finish()
                }
            }
        }
    }

    private fun checkButtonCondition() {
        val firstname = binding.firstNameEdit.text.toString()
        val lastname = binding.lastNameEdit.text.toString()
        val grades = binding.gradesEdit.text.toString().toIntOrNull()

        if (firstname.isNotEmpty() && lastname.isNotEmpty() && grades in 5..15) {
            binding.gradesButton.visibility = View.VISIBLE
        } else {
            binding.gradesButton.visibility = View.INVISIBLE
        }
    }

    override fun onSaveInstanceState(outState: Bundle) {
        outState.putString("firstName", binding.firstNameEdit.text.toString())
        outState.putString("lastName", binding.lastNameEdit.text.toString())
        outState.putInt("grades", binding.gradesEdit.text.toString().toIntOrNull() ?: 0)
        outState.putSerializable("buttonState", buttonState)
        super.onSaveInstanceState(outState)
    }
}
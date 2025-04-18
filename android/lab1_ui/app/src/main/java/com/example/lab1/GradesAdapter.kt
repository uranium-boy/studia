package com.example.lab1

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.lab1.databinding.GradeRowBinding
import java.io.Serializable

data class Grade(
    val name: String,
    val grade: Int?
) : Serializable

class GradesAdapter(
    private val gradeList: ArrayList<Grade>,
    private val inflater: LayoutInflater
) : RecyclerView.Adapter<GradesAdapter.GradeViewHolder>() {

    inner class GradeViewHolder(
        val binding: GradeRowBinding
    ) : RecyclerView.ViewHolder(binding.root) {
        init {
            binding.gradesRadioGroup.setOnCheckedChangeListener { _, checkedId ->
                val selectedGrade = when (checkedId) {
                    R.id.radioButton2 -> 2
                    R.id.radioButton3 -> 3
                    R.id.radioButton4 -> 4
                    R.id.radioButton5 -> 5
                    else -> return@setOnCheckedChangeListener
                }
                gradeList[adapterPosition] = gradeList[adapterPosition].copy(grade = selectedGrade)
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): GradeViewHolder {
        val binding = GradeRowBinding.inflate(inflater, parent, false)
        return GradeViewHolder(binding)
    }

    override fun onBindViewHolder(holder: GradeViewHolder, position: Int) {
        val currentGrade = gradeList[position]
        holder.binding.radioTextView.text = currentGrade.name

        when (currentGrade.grade) {
            2 -> holder.binding.radioButton2.isChecked = true
            3 -> holder.binding.radioButton3.isChecked = true
            4 -> holder.binding.radioButton4.isChecked = true
            5 -> holder.binding.radioButton5.isChecked = true
        }
    }

    override fun getItemCount(): Int {
        return gradeList.size
    }

    fun getGradeList(): ArrayList<Grade> {
        return gradeList
    }
}
import re
import math

filenames = [
    "variance-CNN.csv",
    "variance-RBM.csv",
    "variance-GPF_NN.csv",
    "variance-GPF_NNN.csv",
    "variance-SGDCF_NN.csv",
    "variance-SGDCF_NNN.csv",
    "variance-TF.csv",
    "variance-GTF_NN.csv",
    "variance-GTF_NNN.csv",
]

average_nr_points = 35

for filename in filenames:
    with open(filename, "r") as file:
        lines = file.readline()  # skip first line

        lines = file.readlines()
        index = 0
        numbers = []
        for line in lines:
            result = re.findall(r"(\d+\.?\d*(e-\d+)?)", line)

            number = float(result[2][0])
            numbers.append(number)

            index += 1

        averaged = []
        for i in range(len(numbers)):
            total = 0
            nr_averaged = 0
            for offset in range(-average_nr_points // 2, (average_nr_points // 2) + 1):
                index_to_add = i + offset
                if index_to_add >= 0 and index_to_add < len(numbers):
                    total += math.log(numbers[index_to_add])
                    nr_averaged += 1

            averaged.append(math.exp(total / nr_averaged))

        with open("avg-" + filename, "w") as outfile:
            outfile.write("Step,Averaged Value\n")

            for index, item in enumerate(averaged):
                outfile.write(f"{str(index)},{str(item)}\n")

import re
import math

filenames = {}
for number in range(-36, -1):
    filenames[
        number / 10
    ] = f"variance_1_h{'-' if number < 0 else ''}{abs(number)//10}{abs(number)%10}.csv"


values = []  # output

start_step = 150
for h in filenames:
    with open(filenames[h], "r") as file:
        lines = file.readline()  # skip first line

        lines = file.readlines()
        numbers = []
        for line in lines:
            result = re.findall(r"(\d+\.?\d*(e-\d+)?)", line)

            if len(result) != 3:
                continue

            numbers.append(float(result[2][0]))

        if len(numbers) > start_step:

            cumulative_sum = 0
            nr_averaged = 0
            for i in range(start_step, len(numbers)):
                cumulative_sum += math.log(numbers[i])
                nr_averaged += 1

            values.append((h, math.exp(cumulative_sum / nr_averaged)))


with open("extracted.csv", "w") as outfile:
    outfile.write("h,extracted value\n")

    for item in values:
        outfile.write(f"{str(item[0])},{str(item[1])}\n")

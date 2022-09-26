import re

model_names = [
    "TF",
    "TF-ALT",
    "TF-NO",
    "GTF-NN",
    "GTF-NN-ALT",
    "GTF-NN-NO",
    "GTF-NNN",
    "GTF-NNN-ALT",
    "GTF-NNN-NO",
    "PF",
    "GPF-NN",
    "GPF-NNN",
    "DCF",
    "SDCF-NN",
    "SDCF-NNN",
    "SGDCF-NN",
    "SGDCF-NNN",
    "CF",
]

nr_trainable_params = {
    "TF": 5543332,
    "TF-ALT": 5505700,
    "TF-NO": 5505700,
    "GTF-NN": 5505736,
    "GTF-NN-ALT": 5543368,
    "GTF-NN-NO": 5505736,
    "GTF-NNN": 5505736,
    "GTF-NNN-ALT": 5543368,
    "GTF-NNN-NO": 5505736,
    "PF": 3727012,
    "GPF-NN": 3727012,
    "GPF-NNN": 3727012,
    "DCF": 3747748,
    "SDCF-NN": 3731620,
    "SDCF-NNN": 3733924,
    "SGDCF-NN": 3731620,
    "SGDCF-NNN": 3733924,
    "CF": 7710628,
}

top_accuracy = {
    "TF": 51.30,
    "TF-ALT": 51.03,
    "TF-NO": 49.11,
    "GTF-NN": 49.38,
    "GTF-NN-ALT": 50.01,
    "GTF-NN-NO": 48.42,
    "GTF-NNN": 49.87,
    "GTF-NNN-ALT": 51.58,
    "GTF-NNN-NO": 50.38,
    "PF": 46.39,
    "GPF-NN": 43.26,
    "GPF-NNN": 47.43,
    "DCF": 46.13,
    "SDCF-NN": 47.66,
    "SDCF-NNN": 44.49,
    "SGDCF-NN": 48.78,
    "SGDCF-NNN": 44.39,
    "CF": 50.50,
}

converged_epoch = {
    "TF": 62,
    "TF-ALT": 66,
    "TF-NO": 63,
    "GTF-NN": 68,
    "GTF-NN-ALT": 80,
    "GTF-NN-NO": 80,
    "GTF-NNN": 70,
    "GTF-NNN-ALT": 75,
    "GTF-NNN-NO": 79,
    "PF": 367,
    "GPF-NN": 403,
    "GPF-NNN": 432,
    "DCF": 96,
    "SDCF-NN": 210,
    "SDCF-NNN": 260,
    "SGDCF-NN": 237,
    "SGDCF-NNN": 260,
    "CF": 106,
}

model_names_translated = {
    "TF": "TF (learned)",
    "TF-ALT": "TF (sinus)",
    "TF-NO": "TF (none)",
    "GTF-NN": "GTF-NN (sinus)",
    "GTF-NN-ALT": "GTF-NN (learned)",
    "GTF-NN-NO": "GTF-NN (none)",
    "GTF-NNN": "GTF-NNN (sinus)",
    "GTF-NNN-ALT": "GTF-NNN (learned)",
    "GTF-NNN-NO": "GTF-NNN (none)",
    "PF": "PF",
    "GPF-NN": "GPF-NN",
    "GPF-NNN": "GPF-NNN",
    "DCF": "DCF",
    "SDCF-NN": "SDCF-NN",
    "SDCF-NNN": "SDCF-NNN",
    "SGDCF-NN": "SGDCF-NN",
    "SGDCF-NNN": "SGDCF-NNN",
    "CF": "CF",
}

for name in model_names:

    epoch_time_in_s = 0
    with open(f"{name}.txt", "r") as file:
        for i in range(8):  # cut stuff and first line from file
            file.readline()

        epoch_time_in_ms = 0
        number_of_elements_in_log_batch = 50
        for i in range(17):  # last line is no complete set, therefore also cut
            line = file.readline()
            result = re.findall(r"(\d+\.\d+)", line)

            epoch_time_in_ms += float(result[4]) * number_of_elements_in_log_batch
            epoch_time_in_ms += float(result[5]) * number_of_elements_in_log_batch
            epoch_time_in_ms += float(result[6]) * number_of_elements_in_log_batch

        epoch_time_in_s = epoch_time_in_ms / 1000.0

    # name, max_accuracy, epoch_with_max_accuracy, nr_parameters, time_per_epoch, time_until_max, time_per_param_factor, time_per_accuracy_factor, params_per_accuracy_factor
    print(
        f"{model_names_translated[name]} & \\SI{{{top_accuracy[name]:.2f}}}{{\\percent}}  & \\SI{{{converged_epoch[name]}}}{{}} & \\SI{{{nr_trainable_params[name]}}}{{}} & \\SI{{{epoch_time_in_s:.2f}}}{{\\second}} & \\SI{{{(epoch_time_in_s*converged_epoch[name]/60/60):.2f}}}{{\\hour}} & \\SI{{{(epoch_time_in_s/nr_trainable_params[name] / 0.00007054):.2f}}}{{}} & \\SI{{{(epoch_time_in_s*converged_epoch[name]/top_accuracy[name]/472.57):.2f}}}{{}} & \\SI{{{(nr_trainable_params[name]/top_accuracy[name]/108057.15399610):.2f}}}{{}} \\\\"
    )

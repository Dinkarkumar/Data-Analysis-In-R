x <- 1:526713
latitude_function <- function(x){json_data2$dataset$latitude[[x]]}
latitude <- sapply(x,latitude_function)
longitude_function <- function(x){json_data2$dataset$longitude[[x]]}
longitude <- sapply(x,longitude_function)
id_function <- function(x){json_data2$dataset$id[[x]]}
id <- sapply(x,id_function)
speed_function <- function(x){json_data2$dataset$speed[[x]]}
speed <- sapply(x,speed_function)
acc_x_mean_function <- function(x){mean(json_data2$dataset$accelerometer$x[[x]])}
acc_x_mean <- sapply(x,acc_x_mean_function)
acc_y_mean_function <- function(x){mean(json_data2$dataset$accelerometer$y[[x]])}
acc_y_mean <- sapply(x,acc_y_mean_function)
acc_z_mean_function <- function(x){mean(json_data2$dataset$accelerometer$z[[x]])}
acc_z_mean <- sapply(x,acc_z_mean_function)
acc_x_median_function <- function(x){median(json_data2$dataset$accelerometer$x[[x]])}
acc_x_median <- sapply(x,acc_x_median_function)
acc_y_median_function <- function(x){median(json_data2$dataset$accelerometer$y[[x]])}
acc_y_median <- sapply(x,acc_y_median_function)
acc_z_median_function <- function(x){median(json_data2$dataset$accelerometer$z[[x]])}
acc_z_median <- sapply(x,acc_z_median_function)
m <- cbind(id,speed,latitude,longitude,acc_x_mean,acc_y_mean,acc_z_mean,acc_x_median,acc_y_median,acc_z_median)
df <- as.data.frame(m)
write.csv(df,file = "json_dataset_2.csv")
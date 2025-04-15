# Chọn image nền là OpenJDK 11
FROM maven:3-openjdk:21 AS build

# Cài đặt Maven
RUN apt-get update && apt-get install -y maven

# Đặt thư mục làm việc trong container
WORKDIR /app

# Sao chép pom.xml (và các file cần thiết khác) vào container
COPY pom.xml /app

# Tải các phụ thuộc của Maven
RUN mvn dependency:go-offline

# Sao chép mã nguồn vào container
COPY src /app/src

# Biên dịch và xây dựng ứng dụng Java
RUN mvn clean install -DskipTests

# Chạy ứng dụng Java
CMD ["java", "-jar", "target/your-app.jar"]

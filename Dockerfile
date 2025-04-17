# Sử dụng image Maven + JDK 21
FROM maven:3.9.4-eclipse-temurin-21 AS build

# Đặt thư mục làm việc trong container
WORKDIR /app

# Sao chép pom.xml và tải các phụ thuộc
COPY pom.xml /app
RUN mvn dependency:go-offline

# Sao chép toàn bộ mã nguồn
COPY src /app/src

# Build project (không chạy test)
RUN mvn clean install -DskipTests

# Chạy ứng dụng (hãy thay your-app.jar bằng tên thực tế)
CMD ["java", "-jar", "target/your-app.jar"]

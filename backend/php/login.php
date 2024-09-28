<?php

include_once('connection.php');





if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get the JSON input
    $input = json_decode(file_get_contents('php://input'), true);
    $email = $input['email'];
    $password = $input['password'];

    // Prepare SQL statement to get user details
    $stmt = $conn->prepare("SELECT password, role FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();
    
    // Check if user exists
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($hashedPassword, $role);
        $stmt->fetch();

        // Verify the password
        if (password_verify($password, $hashedPassword)) {
            // Check the role
            if ($role === 'user') {
                echo json_encode(["success" => true]);
            } else {
                echo json_encode(["success" => false, "message" => "You do not have permission to access this area."]);
            }
        } else {
            echo json_encode(["success" => false, "message" => "Invalid password."]);
        }
    } else {
        echo json_encode(["success" => false, "message" => "User not found."]);
    }

    // Close the statement and connection
    $stmt->close();
    $conn->close();
}

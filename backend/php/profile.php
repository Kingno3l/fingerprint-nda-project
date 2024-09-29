<?php
session_start(); // Start the session

include_once('connection.php');

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    echo "User not logged in.";
    exit; // Exit if user is not logged in
}

// Get the current logged-in user's ID
$userId = $_SESSION['user_id'];

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the form data
    $dob = $_POST['dob'];
    $phone = $_POST['phone'];
    $rank = $_POST['rank']; // Keep it as a string
    $department = $_POST['department'];
    $staffID = $_POST['staffID'];
    $address_staff = $_POST['address_staff'];
    $nextOfKinName = $_POST['nextOfKinName'];
    $nextOfKinPhone = $_POST['nextOfKinPhone'];

    // Assuming you have already retrieved values from POST as shown previously
// Start transaction
$conn->begin_transaction();
try {
    // Insert into user_profiles table
    $stmt = $conn->prepare("INSERT INTO user_profiles (user_id, date_of_birth, phone_number, rank_level, department, staff_id, address_staff, next_of_kin_name, next_of_kin_phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

    // Correctly bind the parameters
    $stmt->bind_param("ississsss", $userId, $dob, $phone, $rank, $department, $staffID, $address_staff, $nextOfKinName, $nextOfKinPhone);
    $stmt->execute();
    $stmt->close();

    // Commit transaction
    $conn->commit();
    echo "Profile saved successfully!";
} catch (Exception $e) {
    // Rollback transaction if something failed
    $conn->rollback();
    echo "Error: " . $e->getMessage();
}

}

// Close the connection
$conn->close();
?>

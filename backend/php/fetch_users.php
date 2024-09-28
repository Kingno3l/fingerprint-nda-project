<?php
// Database connection
$conn = new mysqli('localhost', 'root', '', 'fingerprint');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query to fetch users with null indexfinger and middlefinger
$sql = "SELECT id, fullname FROM users WHERE indexfinger IS NULL AND middlefinger IS NULL";
$result = $conn->query($sql);

$users = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $users[] = array("id" => $row['id'], "fullname" => $row['fullname']);
    }
}

// Return the result as a JSON object
echo json_encode($users);

$conn->close();
?>

<?php
include_once '_partials/_header.php';

?>

<div class="container-fluid">
<div class="card w-100">
    <div class="card-body p-4">
        <h5 class="card-title fw-semibold mb-4">Your Break Requests</h5>
        <div class="table-responsive">
            <table class="table text-nowrap mb-0 align-middle">
                <thead class="text-dark fs-4">
                    <tr>
                        <th class="border-bottom-0">
                            <h6 class="fw-semibold mb-0">Id</h6>
                        </th>
                        <th class="border-bottom-0">
                            <h6 class="fw-semibold mb-0">Leave Time</h6>
                        </th>
                        <th class="border-bottom-0">
                            <h6 class="fw-semibold mb-0">Return Time</h6>
                        </th>
                        <th class="border-bottom-0">
                            <h6 class="fw-semibold mb-0">Reason</h6>
                        </th>
                        <th class="border-bottom-0">
                            <h6 class="fw-semibold mb-0">Status</h6>
                        </th>
                        <th class="border-bottom-0">
                            <h6 class="fw-semibold mb-0">Action</h6>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // Include database connection
                    require_once '../backend/php/connection.php';
                    
                    // Assuming the user's ID is stored in session
                    $user_id = $_SESSION['user_id'];

                    // Query to fetch leave requests for the logged-in user
                    $sql = "SELECT id, leave_time, return_time, reason, created_at, status FROM leave_requests WHERE user_id = ? ORDER BY created_at DESC";
                    $stmt = $conn->prepare($sql);
                    $stmt->bind_param("i", $user_id);
                    $stmt->execute();
                    $result = $stmt->get_result();

                    if ($result->num_rows > 0) {
                        $counter = 1; // Initialize a counter
                        while ($row = $result->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td class='border-bottom-0'><h6 class='fw-semibold mb-0'>" . $counter . "</h6></td>"; // Use counter
                            echo "<td class='border-bottom-0'><h6 class='fw-semibold mb-0'>" . date('h:i A', strtotime($row['leave_time'])) . "</h6></td>";
                            echo "<td class='border-bottom-0'><h6 class='fw-semibold mb-0'>" . date('h:i A', strtotime($row['return_time'])) . "</h6></td>";
                            echo "<td class='border-bottom-0'><p class='mb-0 fw-normal'>" . htmlspecialchars($row['reason']) . "</p></td>";
                            echo "<td class='border-bottom-0'><span class='badge bg-" . ($row['status'] == 'approved' ? 'success' : ($row['status'] == 'pending' ? 'warning' : 'danger')) . " rounded-3 fw-semibold'>" . ucfirst($row['status']) . "</span></td>";
                            echo "<td class='border-bottom-0'>";
                            
                            // Action buttons based on status
                            if ($row['status'] == 'pending') {
                                // Delete button for pending requests
                                echo "<a href='delete_request.php?id=" . $row['id'] . "' class='btn btn-danger btn-sm' onclick='return confirm(\"Are you sure you want to delete this request?\")'>Delete</a>";
                            } elseif ($row['status'] == 'approved') {
                                // Request extension button for approved requests
                                echo "<a href='request_extension.php?id=" . $row['id'] . "' class='btn btn-primary btn-sm'>Request Extension</a>";
                            } elseif ($row['status'] == 'denied') {
                                // Reason button for disapproved requests
                                echo "<a href='see_disapproval_reason.php?id=" . $row['id'] . "' class='btn btn-info btn-sm'>See Reason</a>";
                            }

                            echo "</td>";
                            echo "</tr>";
                            $counter++; // Increment the counter
                        }
                    } else {
                        echo "<tr><td colspan='6' class='text-center'>No break requests found.</td></tr>";
                    }
                    

                    // Close the statement
                    $stmt->close();

                    // Close the connection
                    $conn->close();
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

</div>       

<?php
include_once '_partials/_footer.php';

?>

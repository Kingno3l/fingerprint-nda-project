<?php
include_once '_partials/_header.php';

?>

<div class="container-fluid">
    <div class="card">
        <div class="card-body">
            <form method="POST" action="../backend/php/submit_leave_request.php">
                <div class="mb-3">
                    <label for="leaveTime" class="form-label">Time to Leave</label>
                    <input type="time" class="form-control" id="leaveTime" name="leave_time" required min="08:00" max="16:00">
                </div>
                <div class="mb-3">
                    <label for="returnTime" class="form-label">Time to Return</label>
                    <input type="time" class="form-control" id="returnTime" name="return_time" required min="08:00" max="16:00">
                </div>
                <div class="mb-3">
                    <label for="reason" class="form-label">Reason for Leaving</label>
                    <textarea class="form-control" id="reason" name="reason" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit Request</button>
            </form>
        </div>
    </div>
</div>





<?php
include_once '_partials/_footer.php';

?>
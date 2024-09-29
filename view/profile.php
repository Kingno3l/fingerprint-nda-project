<?php
include_once '_partials/_header.php';

?>

<div class="container-fluid">
    <div class="card">
        <div class="card-body">
        <form method="POST" action="../backend/php/profile.php">
    <div class="mb-3">
        <label for="dob" class="form-label">Date of Birth</label>
        <input type="date" class="form-control" id="dob" name="dob" required>
    </div>
    <div class="mb-3">
        <label for="phone" class="form-label">Phone Number</label>
        <input type="tel" class="form-control" id="phone" name="phone" required>
    </div>
    <div class="mb-3">
        <label for="rank" class="form-label">Rank/Level</label>
        <select class="form-control" id="rank" name="rank" required>
            <option value="" disabled selected>Select your level</option>
            <option value="4">Level 4</option>
            <option value="5">Level 5</option>
            <option value="6">Level 6</option>
            <option value="7">Level 7</option>
            <option value="8">Level 8</option>
            <option value="9">Level 9</option>
            <option value="10">Level 10</option>
            <option value="11">Level 11</option>
            <option value="12">Level 12</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="department" class="form-label">Department</label>
        <select class="form-control" id="department" name="department" required>
            <option value="" disabled selected>Select Department</option>
            <option value="Transmission">Transmission</option>
            <option value="Distribution">Distribution</option>
            <option value="Customer Service">Customer Service</option>
            <option value="Maintenance">Maintenance</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="staffID" class="form-label">Staff ID</label>
        <input type="text" class="form-control" id="staffID" name="staffID" value="KEDC-<?php echo str_pad(rand(0, 9999), 4, '0', STR_PAD_LEFT); ?>" readonly>
    </div>
    <div class="mb-3">
        <label for="address" class="form-label">Address</label>
        <input type="text" class="form-control" id="address" name="address_staff" required>
    </div>
    <div class="mb-3">
        <label for="nextOfKinName" class="form-label">Next of Kin Name</label>
        <input type="text" class="form-control" id="nextOfKinName" name="nextOfKinName" required>
    </div>
    <div class="mb-3">
        <label for="nextOfKinPhone" class="form-label">Next of Kin Phone Number</label>
        <input type="tel" class="form-control" id="nextOfKinPhone" name="nextOfKinPhone" required>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>


        </div>
    </div>
</div>
<?php
include_once '_partials/_footer.php';

?>
function loginUser() {
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    // Prepare the data to send to the server
    const formData = {
        email: email,
        password: password,
    };

    fetch('../backend/php/login.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Redirect to dashboard.html if login is successful
            window.location.href = 'dashboard.php';
        } else {
            // Show the error message
            document.getElementById('responseMessage').innerText = data.message;
        }
    })
    .catch(error => {
        console.error('Error:', error);
        document.getElementById('responseMessage').innerText = 'An error occurred. Please try again.';
    });
}



/* 
function loginUser() {
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    // Prepare the data to send to the server
    const formData = {
        email: email,
        password: password,
    };

    fetch('../backend/php/login.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Store login status in localStorage
            localStorage.setItem('isLoggedIn', 'true'); // Store the fact that the user is logged in
            
            // Redirect to dashboard.html if login is successful
            window.location.href = 'dashboard.php';
        } else {
            // Show the error message
            document.getElementById('responseMessage').innerText = data.message;
        }
    })
    .catch(error => {
        console.error('Error:', error);
        document.getElementById('responseMessage').innerText = 'An error occurred. Please try again.';
    });
}
 */
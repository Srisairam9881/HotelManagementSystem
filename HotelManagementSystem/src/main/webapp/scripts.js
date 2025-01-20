function validateForm(event) {
    document.getElementById('error-message').innerHTML = '';

    var mobile = document.querySelector('[name="MobileNumber"]').value;
    var password = document.querySelector('[name="Password"]').value;
    var confirmPassword = document.querySelector('[name="confirmPassword"]').value;
    var errorMessage = "";

    if (mobile.length !== 10 || isNaN(mobile)) {
        errorMessage += "Mobile number must be exactly 10 digits.<br>";
    }

    var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    if (!passwordPattern.test(password)) {
        errorMessage += "Password must contain at least one uppercase letter, one lowercase letter, one number, one special character, and be at least 8 characters long.<br>";
    }

    if (password !== confirmPassword) {
        errorMessage += "Passwords do not match.<br>";
    }

    if (errorMessage !== "") {
        document.getElementById('error-message').innerHTML = errorMessage;
        event.preventDefault();
        return false;
    }

    return true;
}

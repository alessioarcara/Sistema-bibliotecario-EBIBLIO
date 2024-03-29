const login = document.querySelector('#login-form');

if (login)
  login.addEventListener('submit', e => {
    e.preventDefault();

    const formData = new FormData();
    const email = document.querySelector('#email').value;
    formData.append('email', email.toLowerCase());
    formData.append('password', document.querySelector('#password').value);
    //console.log(document.querySelector('#email'), document.querySelector('#password'));

    fetch('API/login.php', {
      method: 'POST',
      body: formData
    })
    .then( res => {
      if (res.ok) {
        document.cookie = 'email=' + email.toLowerCase();
    
        location.assign('/user');
      }
      else alert('Email o Password errati oppure account SOSPESO!');
    })
    .catch( err => console.log(err));
    
  });
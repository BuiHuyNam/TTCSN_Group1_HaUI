function dangky() {
  var email = document.getElementById('email').value;
  var rex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  if (email == '') {
    window.alert("vui lòng nhập địa chỉ email");
    return false;
  }
  if(!rex.test(email)){
     
    window.alert("Email không hợp lệ !");
  }
  var tendangnhap =document.getElementById('tendn').value;
  var rex1= /^[a-zA-Z0-9_]{6,}$/;
  if(tendangnhap==''){
    window.alert('Vui lòng nhập tên đăng nhập');
    return false;
  }
  if(!rex1.test(tendangnhap)){
    window.alert('Tên đăng nhập càn tối thiểu 6 ký tự');
  }
  var mk1 = document.getElementById('mk1').value;
  var mk2 = document.getElementById('mk2').value;
  if(mk1!=mk2)
  {
    window.alert('Hai mật khẩu không khớp nhau');
  }
}
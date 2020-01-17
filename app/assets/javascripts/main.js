window.addEventListener("load", function() {
  const pwd = document.getElementById('password');
  const pwdCheck = document.getElementById('password-check');

  const select_year = document.getElementById('select_year');
  const select_month = document.getElementById('select_month');
  const select_day = document.getElementById('select_day');
  let i;

  
  $set_year();
  $set_month();
  $set_day();
  select_year.addEventListener('change',$set_day)
  select_month.addEventListener('change',$set_day)
  
  function $set_year(){
    // 年を生成(100年分)
    for(i = 2020; i >= 1900; i--){
      let op = document.createElement('option');
      op.value = i;
      op.text = i;
      select_year.appendChild(op);
    }
  }
  
  function $set_month(){
    // 月を生成(12)
    for(i = 1; i <= 12; i++){
      let op = document.createElement('option');
      op.value = i;
      op.text = i;
      select_month.appendChild(op);
    }
  }
  
  function $set_day(){
    //日の選択肢を空にする
    let children = select_day.children
    while(children.length){
      children[0].remove()
    }
    // 日を生成(動的に変える)
    if(select_year.value !== '' &&  select_month.value !== ''){
      const last_day = new Date(select_year.value,select_month.value,0).getDate()
      
      for (i = 1; i <= last_day; i++) {
        let op = document.createElement('option');
        op.value = i;
        op.text = i;
        select_day.appendChild(op);
      }
    }
  }

  pwdCheck.addEventListener('change', function() {
    if(pwdCheck.checked) {
        pwd.setAttribute('type', 'text');
    } else {
        pwd.setAttribute('type', 'password');
    }
  }, false);
});
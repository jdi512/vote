<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

</body>
<script>
setInterval(function () {
      let now = new Date();
      let year = now.getFullYear();
      let month = now.getMonth() + 1;
      let date = now.getDate();
      let hour = now.getHours();
      let minute = now.getMinutes();
      let second = now.getSeconds();
      let Monthzero = '';
      let Datezero = '';
      let Hourzero = '';
      let Minutezero = '';
      let Secondzero = '';
      if (month < 10) {
        Monthzero += '0'
      }
      if (date < 10) {
        Datezero += '0'
      }
      if (hour < 10) {
        Hourzero += '0'
      }
      if (minute < 10) {
        Minutezero += '0'
      }
      if (second < 10) {
        Secondzero += '0'
      }

      let time = year + '-' + Monthzero + month + '-' + Datezero + date + ' ' + Hourzero + hour + '<b class="blink">:</b>' + Minutezero + minute + '<b class="blink">:</b>' + Secondzero + second;
      document.querySelector('#current-time').innerHTML = time;
    }, 1000);
  </script>
</html>
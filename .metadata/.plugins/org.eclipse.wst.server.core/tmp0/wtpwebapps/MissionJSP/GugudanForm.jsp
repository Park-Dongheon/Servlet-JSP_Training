<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 폼</title>
<style>
    form {
        display: flex;
        flex-direction: column;
    }
    .form-group {
        margin-bottom: 10px;
    }
    #selBtn {
        width: 50px; /* 기본 크기로 설정 */
    }
</style>
<script>
    function toggleRadio(radioGroup) {
        let radios = document.getElementsByName(radioGroup);
        for (let i = 0; i < radios.length; i++) {
            radios[i].onclick = function() {
                if (this.wasClicked) {
                    this.checked = false;
                }
                this.wasClicked = this.checked;
            };
        }
    }

    window.onload = function() {
        toggleRadio('orientation');
        toggleRadio('Gugudan');
    };
</script>
</head>
<body>
	<form action="GugudanProc.jsp" method="get">
		<div class="form-group">
			<input type="radio" id="Type1" name="Gugudan" value="Type1" />
			<label for="Type1">Type1</label>
			<input type="number" id="dan" name="dan"/>
			단
		</div>
		<div class="form-group">
			<input type="radio" id="Type2" name="Gugudan" value="Type2" />
			<label for="Type2">Type2</label>
			<input type="radio" id="hol" name="orientation" value="Horizontal" />
			<label for="hol">Horizontal</label>
			<input type="radio" id="ver" name="orientation" value="Vertical" />
			<label for="ver">Vertical</label>
		</div>
		<div class="form-group">
			<input type="radio" id="Type3" name="Gugudan" value="Type3" />
			<label for="Type3">Type3</label>
			<input type="number" id="col" name="col"/>
			열
		</div>
		<input type="submit" id="selBtn" value="선택" />
	</form>
</body>
</html>
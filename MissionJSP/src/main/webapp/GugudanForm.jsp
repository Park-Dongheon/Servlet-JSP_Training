<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- JSP 페이지의 언어를 Java로 설정하고, 컨텐츠 타입과 페이지 인코딩을 UTF-8로 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 폼</title>
<style>
	/* CSS 스타일 설정 */
    form {
    	/* 폼 요소들을 수직으로 배치하기 위해 flex 방향을 column으로 설정 */
        display: flex;
        flex-direction: column;
    }
    .form-group {
    	/* 폼 그룹 사이의 간격 설정 */
        margin-bottom: 10px;
    }
    #selBtn {
    	/* 선택 버튼의 기본 너비 설정 */
        width: 50px;
    }
</style>
<script>
	//JavaScript 함수 정의
    function toggleRadio(radioGroup) {
        let radios = document.getElementsByName(radioGroup);	// 라디오 버튼 그룹을 가져옴
        for (let i = 0; i < radios.length; i++) {				// 각 라디오 버튼에 대해 반복
            radios[i].onclick = function() {					// 클릭 이벤트 핸들러 설정
                if (this.wasClicked) {							// 이미 클릭된 상태라면
                    this.checked = false;						// 체크 해제
                }
                this.wasClicked = this.checked;					// 클릭 여부 상태 업데이트
            };
        }
    }

    window.onload = function() {		// 페이지 로드 시
        toggleRadio('orientation');		// 'orientation' 라디오 그룹에 대해 toggleRadio 함수 호출
        toggleRadio('Gugudan');			// 'Gugudan' 라디오 그룹에 대해 toggleRadio 함수 호출
    };
</script>
</head>
<body>
	<!-- 폼 시작, 폼 데이터는 "GugudanProc.jsp"로 GET 방식으로 전송 -->
	<form action="GugudanProc.jsp" method="get">
		<div class="form-group">
			<!-- 'Type1' 라디오 버튼과 함께 숫자 입력란 -->
			<input type="radio" id="Type1" name="Gugudan" value="Type1" />
			<label for="Type1">Type1</label>
			<input type="number" id="dan" name="dan"/>
			단
		</div>
		<div class="form-group">
			<!-- 'Type2' 라디오 버튼과 방향 선택을 위한 라디오 버튼들 -->
            <input type="radio" id="Type2" name="Gugudan" value="Type2" />
            <label for="Type2">Type2</label>
            <input type="radio" id="hol" name="dir" value="hor" />
            <label for="hol">Horizontal</label>
            <input type="radio" id="ver" name="dir" value="ver" />
            <label for="ver">Vertical</label>
		</div>
		<div class="form-group">
			<!-- 'Type3' 라디오 버튼과 열 개수를 입력하는 숫자 입력란 -->
            <input type="radio" id="Type3" name="Gugudan" value="Type3" />
            <label for="Type3">Type3</label>
            <input type="number" id="col" name="col" />
			열
		</div>
		<!-- 선택 버튼 -->
		<input type="submit" id="selBtn" value="선택" />
	</form>
</body>
</html>
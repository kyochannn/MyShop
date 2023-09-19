
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>

<style>

	* {
		margin: 0;
		padding: 0;
		
	}
	body {
	}
	.container {
		
		display: flex;
		justify-content: center;
		
	}
	
	form {
		margin-top: 50px;
		width: 70vw;
	}
    .btn {
    	background-color: pink;
	}
	
    .btn:hover {
    	background-color: aquamarine;
    }
    
/*     label {
    	background-color: pink;
    } */

</style>
<body>


	<h1 style="color: white; text-shadow: 2px 2px 2px gray; text-align: center; margin-top: 50px;">BellaDress</h1>

	<div class="container">
		<form name="product" action="./add_pro.jsp" onsubmit="return checkProduct()" method="post"  enctype="multipart/form-data">
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" for="productId">상품아이디</label>
				<input type="text" class="form-control col-md-10" id="productId"
					name="productId">
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text  col-md-2" for="name">상품명</label> <input
					type="text" class="form-control" id="name" name="name">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text  col-md-2" for="unitPrice">상품가격</label>
				<input type="number" class="form-control" id="unitPrice"
					name="unitPrice">
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text  col-md-2" for="description">상품설명</label>
				<textarea name="description" id="description" cols="30" rows="10"
					class="form-control"></textarea>
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text  col-md-2" for="manufacturer">제조사</label>
				<input type="text" class="form-control" id="manufacturer"
					name="manufacturer">
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text  col-md-2" for="category">분류</label>
				<input type="text" class="form-control" id="category"
					name="category">
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text  col-md-2" for="unitsInStock">재고
					수</label> <input type="number" class="form-control" id="unitsInStock"
					name="unitsInStock">
			</div>


			<div class="input-group mb-3 row">
				<label class="input-group-text  col-md-2" for="condition">품질</label>
				<div class="form-check col-md-2">
					<input type="radio" class="form-check-input m-2" id="condition-new"
						name="condition" value="NEW"> <label for="condition-new">A
					</label>
				</div>
				<div class="form-check col-md-2">
					<input type="radio" class="form-check-input m-2" id="condition-old"
						name="condition" value="OLD"> <label for="condition-old">B
					</label>
				</div>
				<div class="form-check col-md-2">
					<input type="radio" class="form-check-input m-2" id="condition-re"
						name="condition" value="RE"> <label for="condition-re">C
					</label>
						
				</div>
			</div>


			<div class="input-group mb-3 row">
				<label class="input-group-text" for="file">이미지파일</label> <input
					type="file" class="form-control" id="file" name="file">
			</div>
			<div class="mb-3 row" style="margin:20px; display: flex; justify-content: center;">
				<a href="./products.jsp" style="margin-right: 20px" class="btn btn col-md-2 rounded-pill">목록으로</a>
				<button type="reset" style="margin-right: 20px"  class="btn btn col-md-2 rounded-pill">지우기</button>
				<button type="submit" style="margin-right: 20px"  class="btn btn col-md-2 rounded-pill">상품등록</button>
			</div>
		</form>

	</div>
	<jsp:include page="script.jsp" />
</body>
</html>
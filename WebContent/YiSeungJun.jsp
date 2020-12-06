<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* { margin: 0;padding: 0; }
li { list-style: none; }
header { width: 100%;height: 100px;float: left;background-color: pink; }
nav { position: relative;width: 100%;height: 300px;float: left;background-color: green; }
main { width: 100%;height: 700px;float: left; }
footer { width: 100%;height: 100px;clear: both;background-color: skyblue; }
nav > ul { position: absolute;top: 50px;right: 50px; }
nav > ul > li { position: relative;float: left;padding: 10px;background-color: yellow;margin-right: 10px; } 
nav > ul > li:hover { background-color: orange; } 
nav > ul > li > ul { position: absolute;top: 40px;left: 0; }
nav > ul > li > ul > li { padding: 10px;background-color: yellow; }
nav > ul > li > ul > li:hover { background-color: orange; }
.hide { display: none; }
</style>
<script type="text/javascript">
window.onload = () => {
	const lis = document.querySelectorAll('nav > ul > li');
	
	for(let i=0;i<lis.length;i++) {
		lis[i].addEventListener('mouseenter', function() {
	 		const uls = document.querySelectorAll('nav > ul > li > ul');
	 		for(let i=0;i<uls.length;i++)
	 			uls[i].classList.add('hide');
	
	 		this.querySelector('ul').classList.remove('hide');
 		});
		lis[i].addEventListener('mouseleave', function() {
	 		this.querySelector('ul').classList.add('hide');
	 	});
	}
};
</script>
</head>
<body>
	<div id="wrap">
		<header>header</header>
		<nav>
			<ul>
				<li>
					메인메뉴1
					<ul class="hide">
						<li><a href="#">서브메뉴1</a>
						<li><a href="#">서브메뉴2</a>
						<li><a href="#">서브메뉴3</a>
						<li><a href="#">서브메뉴4</a>
					</ul>
				</li>
				<li>
					메인메뉴1
					<ul class="hide">
						<li><a href="#">서브메뉴1</a>
						<li><a href="#">서브메뉴2</a>
						<li><a href="#">서브메뉴3</a>
						<li><a href="#">서브메뉴4</a>
					</ul>
				</li>
				<li>
					메인메뉴2
					<ul class="hide">
						<li><a href="#">서브메뉴1</a>
						<li><a href="#">서브메뉴2</a>
						<li><a href="#">서브메뉴3</a>
						<li><a href="#">서브메뉴4</a>
					</ul>
				</li>
				<li>
					메인메뉴3
					<ul class="hide">
						<li><a href="#">서브메뉴1</a>
						<li><a href="#">서브메뉴2</a>
						<li><a href="#">서브메뉴3</a>
						<li><a href="#">서브메뉴4</a>
					</ul>
				</li>
				<li>
					메인메뉴4
					<ul class="hide">
						<li><a href="#">서브메뉴1</a>
						<li><a href="#">서브메뉴2</a>
						<li><a href="#">서브메뉴3</a>
						<li><a href="#">서브메뉴4</a>
					</ul>
				</li>
				<li>
					메인메뉴5
					<ul class="hide">
						<li><a href="#">서브메뉴1</a>
						<li><a href="#">서브메뉴2</a>
						<li><a href="#">서브메뉴3</a>
						<li><a href="#">서브메뉴4</a>
					</ul>
				</li>
			</ul>
		</nav>
		<main>main</main>
		<footer>footer</footer>
	</div>
</body>
</html>
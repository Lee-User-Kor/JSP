<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main class="index">
	<div class="slider">
        <div class="slider-box">
            <div class="slider-list">
            </div>
        </div>
    </div>

    <script>
        const imgArr = [
            'https://deepny.com/web/upload/category/editor/2021/05/10/3250aa252755d59abe9828c4a0be45ec.jpg',
            'https://deepny.com/web/upload/category/editor/2021/05/11/pc-2.jpg',
            'https://deepny.com/web/upload/category/editor/2021/05/04/2febb711e32d93b72d5a902b9900ea44.jpg',
            'https://deepny.com/web/upload/category/editor/2021/05/12/4035ae53998dbb3ab039f6a84dec05b3.jpg',
            'https://deepny.com/web/upload/category/editor/2021/05/10/7665762840b28a4a8afa644460fc5252.jpg'
        ];

        imgArr.push(imgArr[0]); // 첫번째 요소가 마지막에도 들어가도록

        const slider = document.querySelector('.slider');
        const sliderBox = document.querySelector('.slider-box');
        const sliderList = document.querySelector('.slider-list');
        const w = 1588;
        const h = 800;
		const listWidth = imgArr.length * w;
        
        sliderList.style.display = 'flex';
        
        sliderList.style.width = listWidth + 'px';
        sliderBox.style.width = w + 'px';
        sliderBox.style.height = h + 'px';
        sliderBox.style.overflow = 'hidden';

        imgArr.forEach(img => {
            const div = document.createElement('div');
            div.style.backgroundImage = 'url(' + img + ')';
            div.style.backgroundSize = w + 'px';
            div.style.backgroundPosition = 'center';
            div.style.backgroundRepeat = 'no-repeat';
            div.style.width = '100%';
            div.style.height = h + 'px';

            sliderList.appendChild(div);
        });

        let width = 0;

        const sliderHandler = function() {
            width += w;
            if(width == sliderList.clientWidth) {
                width = 0;
                sliderList.style.transition = '';   // 변화에 걸리는 시간을 없애기
            }
            else {
                sliderList.style.transition = '1000ms';
            }
            sliderList.style.transform = 'translate3d(-' + width +'px, 0px, 0px)';
            // 요소를 x축, y축, z축으로 지정한만큼 이동시킨다
            console.log(sliderList.clientWidth);
            console.log(sliderList.clientHeight);
        };

        setInterval(sliderHandler, 2000);   // 지정한 함수를 일정 시간마다 반복하여 호출

    </script>
	<div class="product-list1"> <!-- 상품리스트 -->
		<div class="product">
			<div class="product-img"><img src="https://deepny.com/web/product/small/202105/528b92bf7e250718a6717c601ad675b9.webp"></div>
			<div class="product-content">
				<p>제품명</p>
				<p>가격</p>
			</div>
		</div>
		<div class="product">
			<div class="product-img"><img src="https://deepny.com/web/product/small/202104/d4211e41a2d23401cf60a90facc72299.webp"></div>
			<div class="product-content">
				<p>제품명</p>
				<p>가격</p>
			</div>
		</div>
		<div class="product">
			<div class="product-img"><img src="https://deepny.com/web/product/small/202105/430ec9f04d1e511b8cbf7f3802b8755d.webp"></div>
			<div class="product-content">
				<p>제품명</p>
				<p>가격</p>
			</div>
		</div>
		<div class="product">
			<div class="product-img"><img src="https://deepny.com/web/product/small/202103/151fbdb5590892b424103cdf392bf47f.webp"></div>
			<div class="product-content">
				<p>제품명</p>
				<p>가격</p>
			</div>
		</div>
	</div>
	<div class="product-list2">
		<div class="product">
			<div class="product-img"><img src="https://deepny.com/web/product/small/202103/4fe386d8f41534e3be363a94f067e727.webp"></div>
			<div class="product-content">
				<p>제품명</p>
				<p>가격</p>
			</div>
		</div>
		<div class="product">
			<div class="product-img"><img src="https://deepny.com/web/product/small/202104/f9ef08a511569c5ee8eea3463e2da8ab.webp"></div>
			<div class="product-content">
				<p>제품명</p>
				<p>가격</p>
			</div>
		</div>
		<div class="product">
			<div class="product-img"><img src="https://deepny.com/web/product/small/202103/7c335c6b670bfba660deca424023e739.webp"></div>
			<div class="product-content">
				<p>제품명</p>
				<p>가격</p>
			</div>
		</div>
		<div class="product">
			<div class="product-img"><img src="https://deepny.com/web/product/small/202105/faecccc676af481d01929a7fbf04a8c0.webp"></div>
			<div class="product-content">
				<p>제품명</p>
				<p>가격</p>
			</div>
		</div>
	</div>
</main>
<%@ include file="footer.jsp" %>


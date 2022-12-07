<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<style>

.outer-box{
	display: flex; 
}

/* 본문 공지사항 리스트 */
.list-group {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    padding-left: 30px;
    padding-top: 30px;
    margin-bottom: 0;
    border-radius: 0.25rem;
    width: 65%;
}

.list-group-item.active {
    z-index: 2;
    color: black;
    background-color: #ddead1;
    border-color: lightgray;
}

/* 탭 */
.lead {
    font-size: 1.25rem;
    font-weight: 300;
    color: #3d3f5d;
}

.tab-regular .nav.nav-tabs {
    border-bottom: transparent;
}

.tab-regular .nav.nav-tabs .nav-item {}

.tab-regular .nav.nav-tabs .nav-link {
    display: block;
    padding: 17px 49px;
    color: #71748d;
    background-color: #dddde8;
    margin-right: 5px;
    border-color: #dddde8;
}

.tab-regular .nav-tabs .nav-link.active {
    background-color: #fff;
    border-color: #e6e6f2 #e6e6f2 #fff;
    color: #5969ff;
}

.tab-regular .tab-content {
    background-color: #fff;
    padding: 30px;
    border: 1px solid #e6e6f2;
    border-radius: 4px;
    border-top-left-radius: 0px
}

@media (min-width: 1200px)
.col-xl-11 {
    /* -ms-flex: 0 0 50%; */
    /* flex: 0 0 50%; */
    max-width: 100%;
    margin-top: 29px;
    padding-left: 0;
}

/* 일정 */
.row-striped:nth-of-type(odd){
  background-color: #efefef;
  border-left: 4px #000000 solid;
  border-radius: 5px;
  height: 233px;
}

.row-striped:nth-of-type(even){
  background-color: #ffffff;
  border-left: 4px #efefef solid;
}

.row-striped {
    padding: 15px 0;
}

</style>

<c:import url="../layout/header.jsp" />



<div class=outer-box>
<!-- 공지사항, 전사게시판 -->
	<div class="list-group">
		<a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
			<div class="d-flex w-100 justify-content-between">
				<h5 class="mb-1">첫번째 공지사항입니다</h5>
				<small>3 days ago</small>
			</div>
			<p class="mb-1">Donec id elit non mi porta gravida at eget metus.
				Maecenas sed diam eget risus varius blandit.</p> 
				<small>Donec idelit non mi porta.</small>
		</a>
		<a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
			<div class="d-flex w-100 justify-content-between">
				<h5 class="mb-1">두번째 공지사항입니다</h5>
				<small class="text-muted">3 days ago</small>
			</div>
			<p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p> 
			<small class="text-muted">Donec id elit non mi porta.</small>
		</a> 
		<a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
			<div class="d-flex w-100 justify-content-between">
				<h5 class="mb-1">세번째 공지사항입니다</h5>
				<small class="text-muted">3 days ago</small>
			</div>
			<p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
			<small class="text-muted">Donec id elit non mi porta.</small>
		</a>
		<a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
			<div class="d-flex w-100 justify-content-between">
				<h5 class="mb-1">네번째 공지사항입니다</h5>
				<small class="text-muted">3 days ago</small>
			</div>
			<p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p> 
			<small class="text-muted">Donec id elit non mi porta.</small>
		</a> 
		<a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
			<div class="d-flex w-100 justify-content-between">
				<h5 class="mb-1">다섯번째 공지사항입니다</h5>
				<small class="text-muted">3 days ago</small>
			</div>
			<p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
			<small class="text-muted">Donec id elit non mi porta.</small>
		</a>
	</div>
	
<!-- 결재함 탭 -->      
      <div class="container d-flex justify-content-center" >
            <div class="col-xl-11 col-lg-12 col-md-12 col-sm-12 col-12 mb-5 mt-20" style="margin-top: 26px;">
                            
                            <div class="tab-regular">
                                <ul class="nav nav-tabs " id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">미결함</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">기결함</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">상신함</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc id cursus metus aliquam eleifend mi in. At consectetur lorem donec massa. Nunc scelerisque viverra mauris in aliquam sem fringilla ut. Molestie nunc non blandit massa enim nec dui nunc mattis. Cursus mattis molestie a iaculis at erat pellentesque adipiscing. Augue eget arcu dictum varius duis.</p>
                                       
                                    </div>
                                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <h3>Tab Content 1</h3>
                                        <p>Integer malesuada nunc vel risus commodo. Enim eu turpis egestas pretium aenean pharetra magna. Feugiat in fermentum posuere urna nec tincidunt praesent semper feugiat. Diam vulputate ut pharetra sit amet. At ultrices mi tempus imperdiet.</p>
                                    </div>
                                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                        <h3>Tab Heading Content 2</h3>
                                        <p>Sit amet nisl suscipit adipiscing bibendum est ultricies integer quis. Cursus euismod quis viverra nibh cras pulvinar mattis. Amet risus nullam eget felis eget nunc lobortis mattis. Lacus viverra vitae congue eu. Eu tincidunt tortor aliquam nulla facilisi cras fermentum odio eu. Est placerat in egestas erat imperdiet sed euismod.</p>
                                    </div>
                                </div>
                            </div>
			</div>
		</div><!-- 결재함 end -->


</div><!-- end outer -->

<!-- 일정 -->
	<div class="container" style="width: 51%; margin-top: -255px; margin-right: 62px;">
		<div class="row row-striped">
			<div class="col-2 text-right">
				<h1 class="display-4"><span class="badge badge-secondary">23</span></h1>
				<h2>OCT</h2>
			</div>
			<div class="col-10">
				<h3 class="text-uppercase"><strong>Ice Cream Social</strong></h3>
				<ul class="list-inline">
				    <li class="list-inline-item"><i class="fa fa-calendar-o" aria-hidden="true"></i> Monday</li>
					<li class="list-inline-item"><i class="fa fa-clock-o" aria-hidden="true"></i> 12:30 PM - 2:00 PM</li>
					<li class="list-inline-item"><i class="fa fa-location-arrow" aria-hidden="true"></i> Cafe</li>
				</ul>
				<p>Lorem ipsum dolsit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
		</div>
	</div><!-- 일정 end -->



<c:import url="../layout/footer.jsp" />
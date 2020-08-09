<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../info/header.jsp"></jsp:include>

<!-- <div class="js-fullheight"> -->
<div class="hero-wrap js-fullheight">
	<!-- 분홍색 배경 -->
	<div class="overlay"></div>
	<!-- 동적인 처리 -->
	<div id="particles-js"></div>
</div>

<section class="">
	<div class="container">
		<div class="row content-margin">
			<div class="col-md-8 ftco-animate fadeInUp ftco-animated">
				<h2 class="mb-3">#1. We Love WordPress Themes</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>
				<p>
					<img src="images/image_6.jpg" alt="" class="img-fluid">
				</p>
				<p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>
				<h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>
				<p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>
				<p>
					<img src="images/image_8.jpg" alt="" class="img-fluid">
				</p>
				<p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>
				<p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>
				<p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>
				<p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>
				<div class="tag-widget post-tag-container mb-5 mt-5">
					<div class="tagcloud">
						<a href="#" class="tag-cloud-link">Life</a>
						<a href="#" class="tag-cloud-link">Sport</a>
						<a href="#" class="tag-cloud-link">Tech</a>
						<a href="#" class="tag-cloud-link">Travel</a>
					</div>
				</div>

				<div class="about-author d-flex p-5 bg-light">
					<div class="bio align-self-md-center mr-5">
						<img src="images/person_1.jpg" alt="Image placeholder" class="img-fluid mb-4">
					</div>
					<div class="desc align-self-md-center">
						<h3>Lance Smith</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
					</div>
				</div>

			</div>

			<!-- .col-md-8 -->
			<div class="col-md-4 sidebar ftco-animate order-first fadeInUp ftco-animated">

				<div class="sidebar-box ftco-animate fadeInUp ftco-animated">
					<div class="categories">
						<h3>Categories</h3>
						<ul>
							<li>
								<a href="#"> 에니어그램이란 </a>
							</li>
							<li>
								<a href="#"> 역사 </a>
							</li>
							<li>
								<a href="#" class="type9 dropdown-toggle"> 9가지의 유형 </a>
									<ul class="sub-9">
										<li><a href="#">1유형</a></li>
										<li><a href="#">2유형</a></li>
										<li><a href="#">3유형</a></li>
										<li><a href="#">4유형</a></li>
										<li><a href="#">5유형</a></li>
										<li><a href="#">6유형</a></li>
										<li><a href="#">7유형</a></li>
										<li><a href="#">8유형</a></li>
										<li><a href="#">9유형</a></li>
									</ul>
							</li>

						</ul>
					</div>
					
				</div>

			
				<div class="sidebar-box ftco-animate fadeInUp ftco-animated text-center">
					<c:if test="${login.category=='사용자' }">
						<a href="#" class="btn btn-outline-danger"><button type="button" class="btn btn-outline-danger">등록</button></a>
					</c:if>
					<!-- 나중에 삭제 -->
					<a href="#" ><button type="button" class="btn btn-outline-danger">등록</button></a>
				</div>
				
			</div>
		</div>
</section>

<script>
	$(document).ready( function() {
		$('.type9').click(function(){
			console.log('cc');
			$('.sub-9').toggle();
		});
	});
</script>

<jsp:include page="../info/footer.jsp"></jsp:include>


<%-- 
<jsp:include page="../c_info/header.jsp"></jsp:include>

<!-- Main -->
<div id="main">
	<div class="inner">

		<!-- Header -->
		<header id="header">
			<a href="index.html" class="logo"> <strong>에니어그램이란</strong>
			</a>
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"> <span class="label">Twitter</span>
				</a></li>
				<li><a href="#" class="icon brands fa-facebook-f"> <span class="label">Facebook</span>
				</a></li>
				<li><a href="#" class="icon brands fa-snapchat-ghost"> <span class="label">Snapchat</span>
				</a></li>
				<li><a href="#" class="icon brands fa-instagram"> <span class="label">Instagram</span>
				</a></li>
				<li><a href="#" class="icon brands fa-medium-m"> <span class="label">Medium</span>
				</a></li>
			</ul>
		</header>

		<!-- Banner -->
		<section id="banner">
			<div class="content">
				<header>
					<h1>에니어그램이란</h1>
					<!-- <p>A free and fully responsive site template</p> -->
				</header>
				<p>
					에니어그램은 사람을 이해하는데 도움을 주는 이론이다.<br> 에니어그램은 아홉 가지로 이루어진 인간 성격 유형과 유형들의 연광성을 표시한 기하학적 도형이다. 여러 고대 전통의 영적 지혜에 그 뿌리를 두고 있으며 현대 심리학이 이것을 발달 시켰다.<br> 에니어그램이라는 말은 아홉이라는 뜻의 그리스어 에니어(ennea)와 그림이라는 뜻의 그라모스(grammos)에서 왔다.<br> 즉, 이것은 아홉개의 점으로 이루어진 그림이라는 뜻이다.
				</p>

			</div>
			<span class="image object"> <img src="${pageContext.request.contextPath}/resources/img/enneagram.png" alt="" />
			</span>
		</section>

		<section>
			<!-- 아이콘 제작자 <a href="https://www.flaticon.com/kr/authors/flat-icons" title="Flat Icons">Flat Icons</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon"> www.flaticon.com</a> -->
			<h2>세 개의 상징</h2>
			<p>구르지예프는 에니어그램 상징이 존재의 모든 것을 관장하는 세 가지 신성한 법칙을 나타내는 세 부분으로 구성되어 있다고 설명했다.</p>
			<div class="row gtr-50 gtr-uniform y-t-center">
				<div class="col-4">
					<span class="image fit"><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="" /></span>
					<p class="">Circle : 성격(영혼)의 완성,이상향</p>
				</div>
				<div class="col-4">
					<span class="image fit"><img src="${pageContext.request.contextPath}/resources/img/triangle.png" alt="" /></span>
					<p>Triangle: 조화로운 균형,만물의 구성</p>
				</div>
				<div class="col-4">
					<span class="image fit"><img src="${pageContext.request.contextPath}/resources/img/hexade.png" alt="" /></span>
					<p>Hexade : 변화, 성장, 상호작용</p>
				</div>
			</div>
			<br>
			<h3>원(Circle)</h3>
			<p>이들 중 첫번째는 거의 모든 문화에서 사용하는 원(circle) , 즉 우주의 만다라이다. 원은 통합, 전체, 단일성을 가리키며 신은 하나임을 상징한다.</p>
			<h3>삼각형(Triangle)</h3>
			<p>우리는 원 안에서 또 하나의 상징, 삼각형(triangle) 을 발견한다. [ 9 - 6 - 3 ] 모든 세계의 주요 종교들은 놀랍게도 우주가 이원성이 아니라 삼원성에서 생겨났다고 이야기한다. 대개의 경우 우리가 현실을 보는 방법의 기본은 좋은 것과 나쁜것, 흑과 백, 남성과 여성, 외향성과 내향성 등과 같이 상반되는 두 가지가 하나의 쌍으로 구성된다. 그러나 고대의 전통은 사람을 남성과 여성으로 구분 짓지 않고 남성, 여성, 아이로 구분 지었다. 또 검은 색과 흰색이 아니라 검은색, 흰색, 회색으로 보았다.</p>
			<p>구르지예프는 이러한 현상을 '3의 법칙'이라고 부르면서 존재하는 모든 것은 세 가지 힘이 상호작용한 결과라고 말했다. 심지어 현대 물리학의 발견도 이 3의 법칙을 지지하는 것으로 여겨진다. 한때는 자연에 네 가지 기본적인 힘이 있다고 여겼지만 현대 물리학은 단 세 개의 힘(강력,약력,전자기력)이 존재한다고 믿는다.</p>
			<h3>헥사드(Hexade)</h3>
			<p>세 개의 상징 중 세 번째 부분이 헥사드(hexade) 이다. [ 1 - 4 - 2 - 8 - 5 - 7 ] 이 그림은 구르지예프가 명명한 '7의 법칙'을 상징한다. 또한 존재하는 모든 것은 정체되어 있지 않다는 것을 보여 준다. 모든 것은 움직이고 뭔가 다른 것으로 변화된다. 바위와 별들조차도 결국에는 변형된다. 변화에 작용하는 힘과 그 자체의 성질에 따라서 변화되는 방식이 모두 다르기는 하지만 모든 것은 변화하며 재생되고 진화하고 발전해 나간다.</p>
			<p>한 주일의 날들, 원소 주기율표, 서양 음악의 옥타브도 모두 이 '7의 법칙'에 기본을 둔다. 또한 142857이라는 숫자는 1을 7로 나눈 순환소수 0.142857...과 대응하고 있어 원래 하나였던 것이 7가지로 분열되어 흐른다는 것을 나타내고 있다.</p>
			<p>이 세 요소(원, 삼각형, 헥사드)를 함께 결합하면 에니어그램의 상징이 된다. 이것은 전체성(원)과 세 가지 힘(삼각형)이 어떻게 상호 작용해서 그 결과가 얻어졌는지, 어떻게 그것이 계속해서 변화하고 진화하는지(헥사드)를 보여준다.</p>

		</section>

		<section>
			<h2>3개의 자아</h2>
			<span class="image left"><img src="${pageContext.request.contextPath}/resources/img/3self.png" alt="" /></span>
			<p>
				에니어그램에서는 인간의 성격 유형을 세 개의 그룹, 즉 <strong>본능형</strong>, <strong>감각형</strong>, <strong>사고형</strong> 으로 분류한다
			</p>
			<p>에니어그램 이론에 따르면 이들 세 기능은 인간 신체의 미묘한 '중심들'과 연관되어 있다. 그래서 성격의 고착은 주로 이 세 중심들 중 하나와 관련된다.</p>
			<p>우리가 어떤 유형이든지 간에 우리의 성격에는 이 세 가지의 요소들이 모두 들어있다. 세 가지 요소들은 서로 상호 작용하기 때문에 다른 두 가지는 사용하지 않고 한 가지만 쓸 수는 없다. 그러나 우리들 대부분은 자신의 성격 안에만 묶여 있기 때문에 자신 안에서 이 세 가지 요소를 구분해 내기는 어렵다.</p>
			<p>각각의 성격이 자신의 본질적인 특성으로 취하는 것은, 자신이 동일화하는 것이며 자신의 것으로 만들기를 원하는 제약들이다.</p>
			<p>역설적으로 말해서 어떤 사람의 유형이 감정 중심에 속한다면 그 사람이 다른 사람보다 더 많이 느낀다는 의미가 아니다. 사실상 이 세 중심들이 사용하는 기능(본능,감정,사고)은 에고가 가장 강하게 형성되어 있는 기능이며, 자유롭지 못한 정신의 구성 요소이다.</p>

			<h3>본능(Body) 중심</h3>
			<p>8, 9, 1번 유형 은 자신의 본능, 생명력의 근원, 힘에 이끌린다.</p>
			<p>이들은 몸, 기본적인 삶의 기능, 생존에 관심을 둔다(육체적인 긴장에 근거한 자아의 범주를 창조한다).</p>
			<p>이 유형들은 공격과 억압과 관련된 문제들을 갖는 경향이 있다.</p>
			<p>이들은 자아를 방어하는 행동의 밑바탕에 많은 분노를 가지고 있다.</p>
			<ul class="y-ul">
				<li>관심사: 환경에 저항하고 환경을 통제하는 것</li>
				<li>문제: 분노와 억압</li>
				<li>추구하는 것: 독립성</li>
				<li>내재된 감정: 분노</li>
			</ul>
			<h3>감정(Heart) 중심</h3>
			<p>2, 3, 4번 유형 은 자아 이미지에 관심을 가진다(거짓된, 혹은 가장된 자아에 고착한다).</p>
			<p>이들은 자신에 대한 이야기와 가장된 특성들이 자신의 실제 정체성이라고 믿는다.	</p>
			<p>이들은 자아를 방어하는 행동의 밑바탕에 수치심을 가지고 있다.</p>
			<ul class="y-ul">
				<li>관심사: 거짓된 자아와 자아 이미지에 대한 사랑</li>
				<li>문제: 정체성, 적대감</li>
				<li>추구하는 것: 주의</li>
				<li>내재된 감정: 수치심</li>
			</ul>
			<h3>사고(Head) 중심</h3>
			<p>5, 6, 7번 유형 은 불안감에 관심을 가진다(이들은 지원과 안내의 부족을 경험한다).</p>
			<p>이들은 자신을 안전하게 해 준다고 믿는 일을 하려고 한다.</p>
			<p>이들은 자아를 방어하는 행동의 밑바탕에 두려움을 가지고 있다.</p>
			<ul class="y-ul">
				<li>관심사: 전략과 신념들</li>
				<li>문제: 불안과 불안정</li>
				<li>추구하는 것: 안전함</li>
				<li>내재된 감정: 두려움</li>
			</ul>
		</section>

	</div>
</div>

<jsp:include page="../c_info/sidebar.jsp"></jsp:include>
<jsp:include page="../c_info/footer.jsp"></jsp:include>

 --%>
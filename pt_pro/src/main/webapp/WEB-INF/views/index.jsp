<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./module/nav.jsp"%>
<header class="masthead">
	<div class="container">
		<div class="masthead-subheading">Welcome To KH fitness!</div>
		<div class="masthead-heading text-uppercase">It's Nice To Meet
			You</div>
			<c:if test="${empty sessionScope.loginData}">
				<a class="btn btn-primary btn-xl text-uppercase" href="/pt/login">LOGIN</a>
			</c:if>
			<c:if test="${not empty sessionScope.loginData}">
				<a class="btn btn-primary btn-xl text-uppercase" href="/pt/logout">LOGOUT</a>
			</c:if>
	</div>
</header>
<!-- Footer-->
<footer class="footer py-4">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-4 text-lg-start">Copyright &copy; Your
				Website 2022</div>
			<div class="col-lg-4 my-3 my-lg-0">
				<a class="btn btn-dark btn-social mx-2" href="#!"
					aria-label="Twitter"><i class="fab fa-twitter"></i></a> <a
					class="btn btn-dark btn-social mx-2" href="#!"
					aria-label="Facebook"><i class="fab fa-facebook-f"></i></a> <a
					class="btn btn-dark btn-social mx-2" href="#!"
					aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<div class="col-lg-4 text-lg-end">
				<a class="link-dark text-decoration-none me-3" href="#!">Privacy
					Policy</a> <a class="link-dark text-decoration-none" href="#!">Terms
					of Use</a>
			</div>
		</div>
	</div>
</footer>
<!-- Portfolio item 1 modal popup-->
<div class="portfolio-modal modal fade" id="portfolioModal1"
	tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="close-modal" data-bs-dismiss="modal">
				<img src="${base}/assets/img/close-icon.svg" alt="Close modal" />
			</div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="modal-body">
							<!-- Project details-->
							<h2 class="text-uppercase">Project Name</h2>
							<p class="item-intro text-muted">Lorem ipsum dolor sit amet
								consectetur.</p>
							<img class="img-fluid d-block mx-auto"
								src="${base}/assets/img/portfolio/1.jpg" alt="..." />
							<p>Use this area to describe your project. Lorem ipsum dolor
								sit amet, consectetur adipisicing elit. Est blanditiis dolorem
								culpa incidunt minus dignissimos deserunt repellat aperiam quasi
								sunt officia expedita beatae cupiditate, maiores repudiandae,
								nostrum, reiciendis facere nemo!</p>
							<ul class="list-inline">
								<li><strong>Client:</strong> Threads</li>
								<li><strong>Category:</strong> Illustration</li>
							</ul>
							<button class="btn btn-primary btn-xl text-uppercase"
								data-bs-dismiss="modal" type="button">
								<i class="fas fa-xmark me-1"></i> Close Project
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Portfolio item 2 modal popup-->
<div class="portfolio-modal modal fade" id="portfolioModal2"
	tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="close-modal" data-bs-dismiss="modal">
				<img src="${base}/assets/img/close-icon.svg" alt="Close modal" />
			</div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="modal-body">
							<!-- Project details-->
							<h2 class="text-uppercase">Project Name</h2>
							<p class="item-intro text-muted">Lorem ipsum dolor sit amet
								consectetur.</p>
							<img class="img-fluid d-block mx-auto"
								src="${base}/assets/img/portfolio/2.jpg" alt="..." />
							<p>Use this area to describe your project. Lorem ipsum dolor
								sit amet, consectetur adipisicing elit. Est blanditiis dolorem
								culpa incidunt minus dignissimos deserunt repellat aperiam quasi
								sunt officia expedita beatae cupiditate, maiores repudiandae,
								nostrum, reiciendis facere nemo!</p>
							<ul class="list-inline">
								<li><strong>Client:</strong> Explore</li>
								<li><strong>Category:</strong> Graphic Design</li>
							</ul>
							<button class="btn btn-primary btn-xl text-uppercase"
								data-bs-dismiss="modal" type="button">
								<i class="fas fa-xmark me-1"></i> Close Project
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Portfolio item 3 modal popup-->
<div class="portfolio-modal modal fade" id="portfolioModal3"
	tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="close-modal" data-bs-dismiss="modal">
				<img src="${base}/assets/img/close-icon.svg" alt="Close modal" />
			</div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="modal-body">
							<!-- Project details-->
							<h2 class="text-uppercase">Project Name</h2>
							<p class="item-intro text-muted">Lorem ipsum dolor sit amet
								consectetur.</p>
							<img class="img-fluid d-block mx-auto"
								src="${base}/assets/img/portfolio/3.jpg" alt="..." />
							<p>Use this area to describe your project. Lorem ipsum dolor
								sit amet, consectetur adipisicing elit. Est blanditiis dolorem
								culpa incidunt minus dignissimos deserunt repellat aperiam quasi
								sunt officia expedita beatae cupiditate, maiores repudiandae,
								nostrum, reiciendis facere nemo!</p>
							<ul class="list-inline">
								<li><strong>Client:</strong> Finish</li>
								<li><strong>Category:</strong> Identity</li>
							</ul>
							<button class="btn btn-primary btn-xl text-uppercase"
								data-bs-dismiss="modal" type="button">
								<i class="fas fa-xmark me-1"></i> Close Project
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Portfolio item 4 modal popup-->
<div class="portfolio-modal modal fade" id="portfolioModal4"
	tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="close-modal" data-bs-dismiss="modal">
				<img src="${base}/assets/img/close-icon.svg" alt="Close modal" />
			</div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="modal-body">
							<!-- Project details-->
							<h2 class="text-uppercase">Project Name</h2>
							<p class="item-intro text-muted">Lorem ipsum dolor sit amet
								consectetur.</p>
							<img class="img-fluid d-block mx-auto"
								src="${base}/assets/img/portfolio/4.jpg" alt="..." />
							<p>Use this area to describe your project. Lorem ipsum dolor
								sit amet, consectetur adipisicing elit. Est blanditiis dolorem
								culpa incidunt minus dignissimos deserunt repellat aperiam quasi
								sunt officia expedita beatae cupiditate, maiores repudiandae,
								nostrum, reiciendis facere nemo!</p>
							<ul class="list-inline">
								<li><strong>Client:</strong> Lines</li>
								<li><strong>Category:</strong> Branding</li>
							</ul>
							<button class="btn btn-primary btn-xl text-uppercase"
								data-bs-dismiss="modal" type="button">
								<i class="fas fa-xmark me-1"></i> Close Project
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Portfolio item 5 modal popup-->
<div class="portfolio-modal modal fade" id="portfolioModal5"
	tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="close-modal" data-bs-dismiss="modal">
				<img src="${base}/assets/img/close-icon.svg" alt="Close modal" />
			</div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="modal-body">
							<!-- Project details-->
							<h2 class="text-uppercase">Project Name</h2>
							<p class="item-intro text-muted">Lorem ipsum dolor sit amet
								consectetur.</p>
							<img class="img-fluid d-block mx-auto"
								src="${base}/assets/img/portfolio/5.jpg" alt="..." />
							<p>Use this area to describe your project. Lorem ipsum dolor
								sit amet, consectetur adipisicing elit. Est blanditiis dolorem
								culpa incidunt minus dignissimos deserunt repellat aperiam quasi
								sunt officia expedita beatae cupiditate, maiores repudiandae,
								nostrum, reiciendis facere nemo!</p>
							<ul class="list-inline">
								<li><strong>Client:</strong> Southwest</li>
								<li><strong>Category:</strong> Website Design</li>
							</ul>
							<button class="btn btn-primary btn-xl text-uppercase"
								data-bs-dismiss="modal" type="button">
								<i class="fas fa-xmark me-1"></i> Close Project
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Portfolio item 6 modal popup-->
<div class="portfolio-modal modal fade" id="portfolioModal6"
	tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="close-modal" data-bs-dismiss="modal">
				<img src="${base}/assets/img/close-icon.svg" alt="Close modal" />
			</div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="modal-body">
							<!-- Project details-->
							<h2 class="text-uppercase">Project Name</h2>
							<p class="item-intro text-muted">Lorem ipsum dolor sit amet
								consectetur.</p>
							<img class="img-fluid d-block mx-auto"
								src="${base}/assets/img/portfolio/6.jpg" alt="..." />
							<p>Use this area to describe your project. Lorem ipsum dolor
								sit amet, consectetur adipisicing elit. Est blanditiis dolorem
								culpa incidunt minus dignissimos deserunt repellat aperiam quasi
								sunt officia expedita beatae cupiditate, maiores repudiandae,
								nostrum, reiciendis facere nemo!</p>
							<ul class="list-inline">
								<li><strong>Client:</strong> Window</li>
								<li><strong>Category:</strong> Photography</li>
							</ul>
							<button class="btn btn-primary btn-xl text-uppercase"
								data-bs-dismiss="modal" type="button">
								<i class="fas fa-xmark me-1"></i> Close Project
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${base}/js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
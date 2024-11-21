		   </div>
		<?php if ($page_config["EnableSimpleContainer"] == false) { ?>
				</div>
			</div>
		<?php } else { ?>
			</div>
		<?php }
		if ($page_config["EnableFooter"] == true) { 
			include $_SERVER["DOCUMENT_ROOT"] . "/Footer";
		}
		?>
		</div>
	<!--/form-->
	<?php
	if ($page_config["EnablePostFooter"] == true) { 
		include $_SERVER["DOCUMENT_ROOT"] . "/puzzle/Post-Footer.php";
	}
	?>
	</body>                
</html>
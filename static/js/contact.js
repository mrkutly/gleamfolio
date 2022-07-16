window.addEventListener("DOMContentLoaded", () => {
  const clipboard = ClipboardJS && new ClipboardJS("#email");
  const face = document.querySelector("#face");
  const contactMessage = document.querySelector(".contact-message");

  clipboard.on("success", () => showSuccessMessage(contactMessage));
  clipboard.on("error", () => showFailureMessage(contactMessage));

  if (window.lottie && window.faceData) {
    const animationOptions = {
      container: face,
      animationData: window.faceData,
      loop: true,
      renderer: "svg",
      autoplay: true
    };
    window.anim = lottie.loadAnimation(animationOptions);
  }

  function showSuccessMessage(messageElement) {
    messageElement.innerHTML = `
			<p>
				Great! It's copied to your clipboard. Feel free to send me that email :)
			</p>
		`;
  }

  function showFailureMessage(messageElement) {
    messageElement.innerHTML = `
			<p>
				Hmm there seems to be a problem. You might have to copy and paste the old-fashioned way.
			</p>
		`;
  }
});

document.addEventListener('turbolinks:load', () => {
	const editMessageBtn = document.getElementById('edit-btn')
	const textContent = document.getElementById('content-text')
	const messageForm = document.getElementById('message-content')

	editMessageBtn.addEventListener('click', displayForm)

	function displayForm(event) {
		messageForm.classList.remove('hide')
		messageForm.classList.add('show')
		editMessageBtn.classList.add('hide')
		textContent.classList.add('hide')
		event.preventDefault()
	}
})

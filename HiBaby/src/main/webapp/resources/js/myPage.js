/**
 * 
 */

let reader = new FileReader()
reader.onload = (readerEvent) => {
    document.querySelector('.profileImg').setAttribute('src', readerEvent.target.result)
};
document.querySelector('#file').addEventListener('change', (changeEvent) => {
    let imgFile = changeEvent.target.files[0]
    reader.readAsDataURL(imgFile)
});
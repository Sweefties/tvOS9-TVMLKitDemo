/*
 get document contents from url with callback
 params : url
 return : template XHR
 */
function getDocumentContents(url, loadCallback) {
    var templateXHR = new XMLHttpRequest();
    templateXHR.responseType = "document";
    templateXHR.addEventListener("load", function() { loadCallback(templateXHR) }, false);
    templateXHR.open("GET", url, true);
    templateXHR.send();
    return templateXHR;
}

/*
 Navigation Push Document
 */
function pushDoc(document) {
    navigationDocument.pushDocument(document);
}

/*
 App Launch
 */
App.onLaunch = function(options) {
    var title = "Apple Tv - TVMLKit";
    var description = "Tvml Template example";
    var buttonText = "SHOW!";
    alert(title, description, buttonText, function() {
          var path = "http://localhost:9001/tvml/index.tvml";
          var helloDocument = getDocumentContents(path, function(xhr) {
                                                  navigationDocument.dismissModal();
                                                  navigationDocument.pushDocument(xhr.responseXML);
                                                  });
          });
}

/*
 App Exit
 */
App.onExit = function() {
    console.log('App finished');
}

/*
 Show Custom Alert Template on launch.
 */
function alert(title, description, buttonText, doneCallback) {
    var alertXMLString = `<?xml version="1.0" encoding="UTF-8" ?>
    <document>
        <alertTemplate>
            <title>${title}</title>
            <description>${description}</description>
            <button>
                <text>${buttonText}</text>
            </button>
        </alertTemplate>
    </document>`;
    var parser = new DOMParser();
    var alertDOMElement = parser.parseFromString(alertXMLString, "application/xml");
    alertDOMElement.addEventListener("select", doneCallback, false);
    navigationDocument.presentModal(alertDOMElement);
}
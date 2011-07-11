// setup
def folderPath = "/home/migue/Desktop/Wiki-201105231533.portlet.lar_FILES/groups/14/portlets/36/pages/"
def folder = new File(folderPath)
def outputFolder = "/home/migue/Desktop/Wiki-201105231533.portlet.lar_FILES/groups/14/portlets/36/pages/translated/"
def translatedPrefix = "liferay-wiki-page-"

// traverse all the xml files in the folder
def xml = folder.listFiles( {dir, file-> file ==~ /.*.xml/ } as FilenameFilter).toList().eachWithIndex { file, index -> 
    try{
        def wikiPage = new XmlSlurper().parse(file)
        def translated = new File("${outputFolder}${translatedPrefix}${index}.creole")
        translated << wikiPage.__content    
    } catch (Exception e){
        println "Error processing $file.name"
    }
}

println "Execution finished"

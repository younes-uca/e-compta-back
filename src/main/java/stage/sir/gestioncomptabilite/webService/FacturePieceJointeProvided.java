package stage.sir.gestioncomptabilite.webService;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import stage.sir.gestioncomptabilite.bean.FacturePieceJointe;
import stage.sir.gestioncomptabilite.service.FacturePieceJOinteService;

import static java.nio.file.Paths.get;

@RestController
@RequestMapping(value = "gestion-comptabilite/piece")
public class FacturePieceJointeProvided {
    @Autowired
    FacturePieceJOinteService facturePieceJOinteService;
    @Autowired
    private ServletContext servletContext;
    
    public static final String DIRECTORY = System.getProperty("user.home") + "/facture-pieces-jointes/";

    @GetMapping("/name/{name}")
    public FacturePieceJointe findByName(@PathVariable String name){
        return facturePieceJOinteService.findByName(name);
    }

  /*   @GetMapping("/downloadFile/{filename}")
    public ResponseEntity<Resource> downloadFile(@PathVariable("filename") String filename, HttpServletResponse response) throws IOException, URISyntaxException {
       
        
      FacturePieceJointe databaseFile = facturePieceJOinteService.findById(id);
       File convFile = null;
        String newChemin = databaseFile.getPath();
        convFile = new File(newChemin);
        convFile.createNewFile();
        MediaType mediaType = MediaTypeUtils.getMediaTypeForFileName(this.servletContext, databaseFile.getPath());
        InputStreamResource resource = new InputStreamResource(new FileInputStream(convFile));

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + convFile.getName())
                .contentType(mediaType)
                .contentLength(convFile.length()) //
                .body(resource);*/

       /* Path filePath = get(DIRECTORY).toAbsolutePath().normalize().resolve(filename);
        Resource resource = new UrlResource(filePath.toUri());
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("File-Name", filename);
        httpHeaders.add(HttpHeaders.CONTENT_DISPOSITION, "attachement;File-Name" + resource.getFilename());
        return ResponseEntity.ok().contentType(MediaType.parseMediaType(Files.probeContentType(filePath))).headers(httpHeaders).body(resource);
    
    }*/
}

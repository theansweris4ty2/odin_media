package main


import "core:fmt"
import "core:os"
import "vendor:http/client"
import "core:encoding/xml"
import "core:strings"
import k2d "vendor:karl2d"

main::proc(){
    
    k2d.init(1000, 800, "RSS Reader")
    
    buf : [256]byte
    feeds, err := os.open("feeds.config")
        if err != nil {
            fmt.eprintln("Failed to open file:", err)
        }
    os.read(feeds, buf[:])
    feeds_urls := strings.split(string(buf[:]), "\n")

    for feed in feeds_urls {
    
    res, err2 := client.get(strings.trim(feed, "\r"))
    if err !=nil {
        fmt.println("Failed to gather feeds:", err)
    }
   

    body, allocation, err3 := client.response_body(&res)

    defer client.response_destroy(&res, body)

    if err3 != nil {
        fmt.eprintln("Failed to read response", err)
    }
    xml_string := fmt.tprintf("%s", body)
    defer free_all(context.temp_allocator)
    
    
    doc, err4 := xml.parse_string(xml_string)
    if err4 != nil {
        fmt.eprintln("Failed to parse XML:", err3)
    }
    defer xml.destroy(doc) // Clean up memory when done
    
    for k2d.update(){
        k2d.clear(k2d.LIGHT_BLUE)

        for element in doc.elements {
            
            switch element.ident {
                case "title":
                    title_string := fmt.tprintf("%s", element.value)
                    k2d.draw_text(title_string, {100, 100}, 15.0, k2d.BLUE)
                case "link":
                    link_string := fmt.tprintf("%s", element.value)
                    k2d.draw_text(link_string, {200, 200}, 15.0, k2d.BLUE)
                case:
                    continue
            }
            
            }
        k2d.present()
        }
        
        
    
            
            
        }
    
    

    }



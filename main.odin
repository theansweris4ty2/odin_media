package main

import "core:fmt"
import "core:os"
import "vendor:http/client"
import "core:encoding/xml"
import "core:strings"

main::proc(){
    
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
    for element in doc.elements {
            
            switch element.ident {
                case "title":
                    fmt.printf("%s Title: %s %s \n", BOLD, element.value, RESET)
                case "link":
                    fmt.printf("%s %s link: %s %s \n", FG_BLUE, UNDERLINE, element.value,RESET )
                case:
                    continue
            }
            }       
}
    }


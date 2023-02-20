# MAP OF TAIWAN (Last update: 2023/2/20)

## Shape files

url <- 'https://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=72874C55-884D-4CEA-B7D6-F60B0BE85AB0'
path1 <- tempfile(fileext = ".zip")
if (file.exists(path1))  'file alredy exists' else download.file(url, path1, mode="wb")
zip::unzip(zipfile = path1,exdir = 'Data')
taiwan <- rgdal::readOGR('Data/COUNTY_MOI_1090820.shp', use_iconv=TRUE, encoding='UTF-8')


## FRELab Location

FRE <- paste(sep = "<br/>",
             "<b><a href='https://www.dipintothereef.com/'>FRELAb TAIWAN</a></b>",
             "Functional Reef Ecology Lab",
             "Institute of Oceanography, NTU")


## Leaflet map

map <-leaflet::leaflet(taiwan) %>%
  addPolygons(color = "red", weight = 1, fillColor = "red", fillOpacity = 0.9) %>%
  # addTiles(group="Kort") %>%
  #addProviderTiles(provider = providers$CartoDB.DarkMatter) %>% 
  addProviderTiles("Esri.WorldImagery") %>% 
  #addProviderTiles(providers$CartoDB.Positron) %>% 
  addPopups(121.53725, 25.021252, FRE, options = popupOptions(closeButton = TRUE))

map

# map shot

mapview::mapshot(map, file = ".github/taiwan.png")

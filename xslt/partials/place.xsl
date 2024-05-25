<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="xsl tei xs">

    <xsl:template match="tei:place" name="place_detail">
        
        <table class="table entity-table">
            <tbody>
                <?tr >
                    <th>
                        Place
                    </th>
                    <td>
                        <xsl:choose>
                            <xsl:when test="./tei:settlement/tei:placeName">
                                <xsl:value-of select="./tei:settlement/tei:placeName"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="./tei:placeName"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr?>
                <xsl:if test="./tei:location[@type='located_in_place']">
                    <tr>
                        <th>
                            Part of
                        </th>
                        <td>
                            <xsl:for-each select="./tei:location[@type='located_in_place']">
                                    
                                        <li><a href="{./tei:placeName/@key}.html">
                                            <xsl:value-of select="./tei:placeName"/>
                                        </a> </li>                                               
                            </xsl:for-each>
                        </td>
                    </tr>
                </xsl:if> 

                <xsl:if test="./tei:note">
                    <tr>
                        <th>
                            Notes
                        </th>
                        <td>
                            <xsl:value-of select="./tei:note"/>
                        </td>
                    </tr>  
                </xsl:if>

                <xsl:if test=".//tei:location">
                <tr>
                    <th>
                        Latitude
                    </th>
                    <td>
                        <xsl:value-of select="tokenize(./tei:location[1]/tei:geo[1], '\s')[1]"/>
                    </td>
                </tr>
                </xsl:if>
                <xsl:if test=".//tei:location">
                <tr>
                    <th>
                        Longitude
                    </th>
                    <td>
                        <xsl:value-of select="tokenize(./tei:location[1]/tei:geo[1], '\s')[2]"/>
                    </td>
                </tr>
                </xsl:if>
                <xsl:if test="./tei:note">
  
                </xsl:if>

            </tbody>
            
        </table>
        <div id="map"/>
        <div id="map_detail"/>
        <xsl:if test="./tei:location/tei:geo">
            <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
                integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
                crossorigin=""/>
            <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
                integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
                crossorigin=""></script>
            <script>
                var lat = <xsl:value-of select="tokenize(./tei:location[1]/tei:geo[1]/text(), ' ')[1]"/>;
                var long = <xsl:value-of select="tokenize(./tei:location[1]/tei:geo[1]/text(), ' ')[last()]"/>;
                $("#map_detail").css("height", "500px");
                var map = L.map('map_detail').setView([Number(lat), Number(long)], 13);
                L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19,
                attribution: '&amp;copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
                }).addTo(map);
                var marker = L.marker([Number(lat), Number(long)]).addTo(map);
            </script>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>

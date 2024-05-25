<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="xsl tei xs">

    <xsl:template match="tei:place" name="place_detail">
        <div id="map"/>
        <div id="map_detail"/>
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
    </xsl:template>
</xsl:stylesheet>

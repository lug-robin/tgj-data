<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
   
    <xsl:template match="tei:facsimile">
                
        <xsl:if test="./tei:surface">
            <script>.tei-xml-images {
                max-width: 50%; /* Maximale Breite für jedes Bild */
                height: auto;  /* Automatische Anpassung der Höhe */
                }
            </script>
            <xsl:for-each select="./tei:surface/tei:graphic">
                <img class="tei-xml-images">
                    <xsl:attribute name="src">
                        <xsl:value-of select="@url"/>
                    </xsl:attribute>
                </img>
            </xsl:for-each>
        </xsl:if>
    </xsl:template> 
</xsl:stylesheet>


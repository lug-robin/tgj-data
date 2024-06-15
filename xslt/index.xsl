<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://dse-static.foo.bar"
    version="2.0" exclude-result-prefixes="xsl tei xs local">
    
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    

    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>

    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select='"The Genuine Jew"'/>
        </xsl:variable>

    
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml" class="h-100">
    
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
            </head>            
            <body class="d-flex flex-column h-100">
                <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0">
                    <div class="container">
                        <h1><xsl:value-of select="$project_short_title"/></h1>
                        <h2 type="main">About the Project</h2>
                        <text>
                            <body>
                                <p>
                                    The Geniuine Jew is a Newspaper that was published from February to November 1904 in Lviv, at that time part of the Habsburg monarchy, now in the Ukraine. It has been digitised by the <ref source="https://anno.onb.ac.at/info/emj_info.html">Austrian National Library</ref> as PDFs.
                                    The aim of this project is to translate that paper, annotate and enrich it, provide context about the themes and topics written about, the people and places mentioned, and enhance accessibilty to those who do not understand the Yiddish
                                    language using the Open Source and FAIR principles.
                                    <lb/>
                                    <lb/>The Genuine Jew is a Master's thesis project and an ongoing work in process. At the end, it will contain all 31 issues published from February 1904 until October 1904. Currently, the focus lies on enriching the website with content,
                                    enhancing accesibility, and providing Yiddish press translated into the English language for further usage. More features will be added continously.
                                    <lb/>
                                    <lb/>Repository: <href source="https://github.com/lug-robin/tgj-data">https://github.com/lug-robin/tgj-data</href>
                                </p>
                            </body>
                        </text>
                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:div//tei:head">
        <h2 id="{generate-id()}"><xsl:apply-templates/></h2>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p id="{generate-id()}"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <ul id="{generate-id()}"><xsl:apply-templates/></ul>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <li id="{generate-id()}"><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="starts-with(data(@target), 'http')">
                <a>
                    <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
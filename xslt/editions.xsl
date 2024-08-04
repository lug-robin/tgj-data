<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://dse-static.foo.bar"
    version="2.0" exclude-result-prefixes="xsl tei xs local">
    
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    
    <xsl:import href="./partials/shared.xsl"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:import href="./partials/aot-options.xsl"/>
    <xsl:import href="./partials/facsimile.xsl"/>
    <xsl:import href="./partials/container.xsl"/>
    <xsl:import href="./view-type.xsl"/>

    <xsl:variable name="prev">
        <xsl:value-of select="replace(tokenize(data(tei:TEI/@prev), '/')[last()], '.xml', '.html')"/>
    </xsl:variable>
    <xsl:variable name="next">
        <xsl:value-of select="replace(tokenize(data(tei:TEI/@next), '/')[last()], '.xml', '.html')"/>
    </xsl:variable>
    <xsl:variable name="teiSource">
        <xsl:value-of select="data(tei:TEI/@source)"/>
    </xsl:variable>
    <xsl:variable name="downloadLink">
        <a href="{$teiSource}" download="{$teiSource, '.xml', '.html'}" target="blank">Download HTML</a>
    </xsl:variable>
    <xsl:variable name="doc_title">
        <xsl:value-of select=".//tei:titleStmt/tei:title[1]/text()"/>
    </xsl:variable>
    <xsl:variable name="facsimile">
        <xsl:value-of select="data(tei:facsimile/tei:surface/tei:graphic/@url)"/>
    </xsl:variable>


    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml" class="h-100">
    
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                    
                </xsl:call-template>
                
                <style>
                    .navBarNavDropdown ul li:nth-child(2) {
                        display: none !important;
                    }
 
                </style>
            </head>
            <body class="d-flex flex-column h-100">
                
                <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0">
                    <div class="container">
                        <div class="head">
                            <div class="col-md-8 col-lg-8 col-sm-12">
                                
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-2 col-lg-2 col-sm-12">
                                <xsl:if test="ends-with($prev,'.html')">
                                    <h1>
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="$prev"/>
                                            </xsl:attribute>
                                            <i class="bi bi-chevron-left" title="zurück"/>
                                        </a>
                                    </h1>
                                </xsl:if>
                            </div>
                            <div class="col-md-8 col-lg-8 col-sm-12">
                                <h1 align="center">
                                    <xsl:value-of select="$doc_title"/>
                                </h1>
                                <h3 align="center">
                                    <a href="{$teiSource}" target="blank">
                                        <i class="bi bi-download" title="TEI/XML"/>
                                    </a>
                                </h3>
                            </div>
                            <div class="col-md-2 col-lg-2 col-sm-12" style="text-align:right">
                                <xsl:if test="ends-with($next, '.html')">
                                    <h1>
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="$next"/>
                                            </xsl:attribute>
                                            <i class="bi bi-chevron-right" title="weiter"/>
                                        </a>
                                    </h1>
                                </xsl:if>
                            </div>
                            <div id="editor-widget">
                                <xsl:call-template name="annotation-options"></xsl:call-template>
                            </div>
                        </div>
                        
                        <div class="container-fluid" style="margin: 2em auto;">
                            <xsl:call-template name="view-type"/>
                        </div>
                        
                        <div class="container-fluid" style="margin: 2em auto;">
                            <xsl:call-template name="container"/>
                        </div>
                        
                        <div data-index="true">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-lg-6 col-sm-12 container">
                                    <xsl:apply-templates select=".//tei:container"></xsl:apply-templates>
                                </div>
                                    <div class="col-md-6 col-lg-6 col-sm-12 text" style="text-align:left">
                                <xsl:apply-templates select=".//tei:body"></xsl:apply-templates>
                                </div>
                                </div>
                            </div>
                        </div>
                        <head style="text-align:center">
                            <xsl:for-each select="tei:head">
                                <h2>  <xsl:value-of select="text()"/>
                                    <style>
                                        h2 {  font-size: 20pt;  /* Adjust as needed */
                                        }
                                    </style>
                                </h2>
                            </xsl:for-each>     
                        </head>

                        <p style="text-align:left;">
                            <xsl:for-each select=".//tei:note[not(./tei:p)]">
                                <div class="footnotes" id="{local:makeId(.)}">
                                    <xsl:element name="a">
                                        <xsl:attribute name="name">
                                            <xsl:text>fn</xsl:text>
                                            <xsl:number level="any" format="1" count="tei:note"/>
                                        </xsl:attribute>
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:text>#fna_</xsl:text>
                                                <xsl:number level="any" format="1" count="tei:note"/>
                                            </xsl:attribute>
                                            <span style="font-size:7pt;vertical-align:super; margin-right: 0.4em">
                                                <xsl:number level="any" format="1" count="tei:note"/>
                                            </span>
                                        </a>
                                    </xsl:element>
                                    <xsl:apply-templates/>
                                </div>
                            </xsl:for-each>
                        </p>

                    </div>
                    <xsl:for-each select="//tei:back">
                        <div class="tei-back">
                            <xsl:apply-templates/>
                        </div>
                    </xsl:for-each>
                </main>
                
                <xsl:call-template name="html_footer"/>
                <script src="https://unpkg.com/de-micro-editor@0.2.6/dist/de-editor.min.js"></script>
                <script type="text/javascript" src="js/run.js"></script>
                

                <script type="text/javascript" src="js/osd_scroll.js"></script>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:ref">
        <xsl:variable name="source">
            <xsl:value-of select="./@source"/>
            <xsl:value-of select="./@key.html"/>
        </xsl:variable>
        <a href="{$source}" target="_blank">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="tei:p">
        <p id="{local:makeId(.)}" class="yes-index">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:div">
        <div id="{local:makeId(.)}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>  
    
    <xsl:template match="tei:hi[@rend='italic']">
        <em><xsl:apply-templates /></em>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='bold']">
        <strong><xsl:apply-templates /></strong>
    </xsl:template>
   <xsl:template match="tei:head[@style='text-align:center']">
       
   </xsl:template>
            
</xsl:stylesheet>

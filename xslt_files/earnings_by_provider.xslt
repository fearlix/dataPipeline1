<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:key name="provider-services" match="service" use="provider_id"/>

    <xsl:template match="/">
        <html>
            <body>
                <h2>Total Earnings for Providers</h2>
                <xsl:for-each select="/platform/people/providers/provider">
                    <h3><xsl:value-of select="name"/></h3>
                    <p><strong>Total Earnings:</strong> $<xsl:value-of select="sum(key('provider-services', @provider_id)[status='Completed']/cost)"/></p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Specify the output method as HTML -->
    <xsl:output method="html" indent="yes"/>

    <!-- Define a key to group services by provider -->
    <xsl:key name="provider-services" match="service" use="provider_id"/>

    <!-- Root template -->
    <xsl:template match="/">
        <html>
            <body>
                <!-- Page title -->
                <h2>Total Earnings for Providers</h2>

                <!-- Iterate over all providers -->
                <xsl:for-each select="/platform/people/providers/provider">
                    <!-- Display provider name -->
                    <h3><xsl:value-of select="name"/></h3>
                    <p>
                        <!-- Calculate and display total earnings for the provider -->
                        <strong>Total Earnings:</strong> $
                        <xsl:value-of select="sum(key('provider-services', @provider_id)[status='Completed']/cost)"/>
                    </p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

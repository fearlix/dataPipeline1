<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- This XSLT stylesheet transforms XML data into an HTML report showing the total earnings for each provider. It iterates over all providers, calculates the sum of completed service costs for each, and displays the provider's name along with their total earnings.-->
    <xsl:output method="html" indent="yes"/>

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

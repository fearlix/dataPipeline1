<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Service Statistics</title>
                <style>
                    /* CSS for table styling */
                    table {
                    width: 100%;
                    border-collapse: collapse;
                    }
                    th, td {
                    border: 1px solid #ddd;
                    padding: 8px;
                    text-align: left;
                    }
                    th {
                    background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>
                <!-- Page Header -->
                <h2>Service Statistics</h2>

                <!-- Section for displaying service details -->
                <h3>Service Details</h3>
                <table>
                    <!-- Table headers for the service details -->
                    <tr>
                        <th>Service Name</th>
                        <th>Provider</th>
                        <th>Duration (Hours)</th>
                        <th>Requestor(s)</th>
                    </tr>

                    <!-- Loop through all services in the XML -->
                    <xsl:for-each select="/platform/services/service">
                        <tr>
                            <!-- Display the name of the service -->
                            <td><xsl:value-of select="name"/></td>

                            <!-- Fetch and display the provider's name -->
                            <td>
                                <!-- The provider's name is selected by matching the provider_id in the service with the one in the provider list -->
                                <xsl:value-of select="/platform/people/providers/provider[@provider_id=current()/provider_id]/name"/>
                            </td>

                            <!-- Calculate the service duration in hours -->
                            <xsl:variable name="startHour" select="substring(scheduledStart, 12, 2)"/>
                            <xsl:variable name="startMinute" select="substring(scheduledStart, 15, 2)"/>
                            <xsl:variable name="endHour" select="substring(scheduledEnd, 12, 2)"/>
                            <xsl:variable name="endMinute" select="substring(scheduledEnd, 15, 2)"/>
                            <xsl:variable name="durationInMinutes" select="(($endHour - $startHour) * 60) + ($endMinute - $startMinute)"/>

                            <!-- Display the calculated duration in hours -->
                            <td><xsl:value-of select="$durationInMinutes div 60"/></td>

                            <!-- Display the names of all requestors for this service -->
                            <td>
                                <!-- Loop through requestors associated with the current service -->
                                <xsl:for-each select="/platform/people/requestors/requestor[@requestor_id=current()/requestor_id]">
                                    <!-- Display the requestor's name -->
                                    <xsl:value-of select="name"/>
                                    <!-- Add a comma between requestors except for the last one -->
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

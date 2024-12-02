<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Service Statistics</title>
                <style>
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
                <h2>Service Statistics</h2>

                <!-- Table for Individual Service Details -->
                <h3>Service Details</h3>
                <table>
                    <tr>
                        <th>Service Name</th>
                        <th>Provider</th>
                        <th>Duration (Hours)</th>
                        <th>Requestor(s)</th>
                    </tr>
                    <xsl:for-each select="/platform/services/service">
                        <tr>
                            <!-- Service Name -->
                            <td><xsl:value-of select="name"/></td>

                            <!-- Provider Name -->
                            <td>
                                <xsl:value-of select="/platform/people/providers/provider[@provider_id=current()/provider_id]/name"/>
                            </td>

                            <!-- Duration Calculation -->
                            <xsl:variable name="startHour" select="substring(scheduledStart, 12, 2)"/>
                            <xsl:variable name="startMinute" select="substring(scheduledStart, 15, 2)"/>
                            <xsl:variable name="endHour" select="substring(scheduledEnd, 12, 2)"/>
                            <xsl:variable name="endMinute" select="substring(scheduledEnd, 15, 2)"/>
                            <xsl:variable name="durationInMinutes" select="(($endHour - $startHour) * 60) + ($endMinute - $startMinute)"/>

                            <td><xsl:value-of select="$durationInMinutes div 60"/></td>

                            <!-- Requestor Names -->
                            <td>
                                <xsl:for-each select="/platform/people/requestors/requestor[@requestor_id=current()/requestor_id]">
                                    <xsl:value-of select="name"/>
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

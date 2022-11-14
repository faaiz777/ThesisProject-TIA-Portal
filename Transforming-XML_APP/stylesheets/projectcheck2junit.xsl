<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
	xmlns:pcr="http://www.siemens.com/Applications/TiaPortal/ProjectCheck/Report/v1"
	exclude-result-prefixes="pcr">

	<xsl:param name="Timestamp" select="'1970-01-02T00:00:00'" />
	<xsl:param name="Hostname" select="'localhost'" />

	<xsl:template match="pcr:ProjectCheckReport">
		<testsuites>
			<xsl:apply-templates select="pcr:Results"/>
		</testsuites>
	</xsl:template>

	<xsl:key name="results-by-category" match="pcr:Result" use="@RuleCategory"/>

	<xsl:template match="pcr:Results">
		<!-- Muenchian grouping -->
		<xsl:for-each select="pcr:Result[count(. | key('results-by-category', @RuleCategory)[1]) = 1]">
			<xsl:variable name="current-grouping-key" select="@RuleCategory"/>
			<xsl:variable name="current-group" select="key('results-by-category', $current-grouping-key)"/>
			<testsuite>
				<xsl:attribute name="id">
					<xsl:value-of select="position() - 1"/>
				</xsl:attribute>
				<xsl:attribute name="package">
					<xsl:text>Programming style guide for SIMATIC S7-1200 / S7-1500</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="name">
					<xsl:value-of select="@RuleCategory"/>
				</xsl:attribute>
				<xsl:attribute name="hostname">
					<xsl:value-of select="$Hostname"/>
				</xsl:attribute>
				<xsl:attribute name="timestamp">
					<xsl:value-of select="$Timestamp"/>
				</xsl:attribute>
				<xsl:attribute name="time">
					<xsl:text>0</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="tests">
					<xsl:value-of select="count($current-group)"/>
				</xsl:attribute>
				<xsl:attribute name="skipped">
					<xsl:text>0</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="failures">
					<xsl:value-of select="count($current-group[@Severity='Warning']) + count($current-group[@Severity='Error'])"/>
				</xsl:attribute>
				<xsl:attribute name="errors">
					<xsl:text>0</xsl:text>
				</xsl:attribute>
				<properties/>
				<xsl:for-each select="$current-group">
					<xsl:call-template name="Result"/>
				</xsl:for-each>
				<system-out/>
				<system-err/>
			</testsuite>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="Result">
		<testcase>
			<xsl:attribute name="name">
				<xsl:value-of select="@RuleNumber"/>
				<xsl:text>: </xsl:text>
				<xsl:value-of select="@RuleName"/>
			</xsl:attribute>
			<xsl:attribute name="classname">
				<xsl:value-of select="@ObjectType"/>
				<xsl:text>: </xsl:text>
				<xsl:value-of select="@ObjectLocation"/>
				<xsl:value-of select="@ObjectName"/>
			</xsl:attribute>
			<xsl:attribute name="time">
				<xsl:text>0</xsl:text>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="@Severity='Info'">
				</xsl:when>
				<xsl:when test="@Severity='Warning'">
					<failure>
						<xsl:attribute name="type">
							<xsl:value-of select="@Severity"/>
						</xsl:attribute>
						<xsl:attribute name="message">
							<xsl:value-of select="@Message"/>
						</xsl:attribute>
					</failure>
				</xsl:when>
				<xsl:when test="@Severity='Error'">
					<failure>
						<xsl:attribute name="type">
							<xsl:value-of select="@Severity"/>
						</xsl:attribute>
						<xsl:attribute name="message">
							<xsl:value-of select="@Message"/>
						</xsl:attribute>
					</failure>
				</xsl:when>
			</xsl:choose>
		</testcase>
	</xsl:template>

</xsl:stylesheet>

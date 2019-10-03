<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc">
  <NamedLayer>
    <se:Name>links_80_percentage</se:Name>
    <UserStyle>
      <se:Name>links_80_percentage</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule> <!-- Dark Red Layer traffic speed expressway -->
          <se:Name>gis speedlink_data_style2</se:Name>
          <se:Description>
            <se:Title>gis speedlink_data_style2</se:Title>
          </se:Description>		  
		  <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATA</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:16:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:20:00</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>			  
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>10</ogc:Literal>
              </ogc:PropertyIsLessThan> 		  
              </ogc:And> 
          </ogc:Filter>         
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#FF0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer> 
          </se:Rule>
        <se:Rule> <!-- Dark Red Layer traffic speed NOT a expressway -->
        <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATB</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:25:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:30:00</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>			  
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>20</ogc:Literal>
              </ogc:PropertyIsLessThan> 		  
              </ogc:And> 
          </ogc:Filter>         
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#FF0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer> 
          </se:Rule> 
  
		<se:Rule> <!-- Red Layer traffic speed expressway -->
         <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATA</ogc:Literal>
        	      </ogc:PropertyIsEqualTo> 
			<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:25:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:30:00</ogc:Literal>
          </ogc:UpperBoundary>
      	</ogc:PropertyIsBetween>		
               <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>20</ogc:Literal>
              </ogc:PropertyIsGreaterThan> 		   
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>40</ogc:Literal>
              </ogc:PropertyIsLessThan> 		  
              </ogc:And> 
          </ogc:Filter>         
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#FF0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer> 
          </se:Rule>
        <se:Rule> <!-- Red Layer traffic speed NOT a expressway -->
         <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATB</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
	<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:25:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:30:00</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>		
               <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>10</ogc:Literal>
              </ogc:PropertyIsGreaterThan> 		   
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>20</ogc:Literal>
              </ogc:PropertyIsLessThan> 		  
              </ogc:And>  
          </ogc:Filter>         
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#FF0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer> 
          </se:Rule> 
		  
		  
		  <se:Rule> <!-- Amber Layer traffic speed expressway -->
         <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATA</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:25:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:30:00</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>	
               <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>40</ogc:Literal>
              </ogc:PropertyIsGreaterThan> 		   
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>60</ogc:Literal>
              </ogc:PropertyIsLessThan> 		  
              </ogc:And> 
          </ogc:Filter>         
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ffbf00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer> 
          </se:Rule>
        <se:Rule> <!-- Amber Layer traffic speed NOT a expressway -->
         <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATB</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
	<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:25:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:30:020</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>	 	
               <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>21</ogc:Literal>
              </ogc:PropertyIsGreaterThan> 		   
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>40</ogc:Literal>
              </ogc:PropertyIsLessThan> 		  
              </ogc:And>  
          </ogc:Filter>         
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ffbf00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer> 
          </se:Rule> 
		  
		    <se:Rule> <!-- Green Layer traffic speed expressway -->
         <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATA</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
		<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:25:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:30:00</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>		
               <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>60</ogc:Literal>
			</ogc:PropertyIsGreaterThan>				
              </ogc:And> 
          </ogc:Filter>         
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#1fc600</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer> 
          </se:Rule>
        <se:Rule> <!-- Green Layer traffic speed NOT a expressway -->
         <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATB</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:25:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:30:00</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>		
               <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>40</ogc:Literal>
              </ogc:PropertyIsGreaterThan> 		   		  
              </ogc:And>  
          </ogc:Filter>         
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#1fc600</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer> 
            </se:Rule>
		  
		  
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
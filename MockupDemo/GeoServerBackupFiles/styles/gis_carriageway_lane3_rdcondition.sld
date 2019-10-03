<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc">
  <NamedLayer>
    <se:Name>carriage way </se:Name>
    <UserStyle>
      <se:Name>carriage way</se:Name>
      <se:FeatureTypeStyle>
        
        <se:Rule>
          <se:Name>Lane 3 road condition</se:Name>
          <se:Description>
            <se:Title>Lane 3 road condition green</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc"> 
            <ogc:Or> 
          <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
			<ogc:Literal>103103573</ogc:Literal>	
         </ogc:PropertyIsEqualTo>

         <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
			<ogc:Literal>103103577</ogc:Literal>	
         </ogc:PropertyIsEqualTo>
		
              <ogc:PropertyIsEqualTo>
            <ogc:PropertyName>link_id</ogc:PropertyName>
            <ogc:Literal>103066504</ogc:Literal>          
         </ogc:PropertyIsEqualTo> 
              
		<ogc:PropertyIsEqualTo>
          	<ogc:PropertyName>link_id</ogc:PropertyName>
          	<ogc:Literal>116000816</ogc:Literal>
         </ogc:PropertyIsEqualTo>

          <ogc:PropertyIsEqualTo>
             <ogc:PropertyName>link_id</ogc:PropertyName>
            <ogc:Literal>103078566</ogc:Literal>
         </ogc:PropertyIsEqualTo>              
              
         </ogc:Or>
          </ogc:Filter>
         <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#10b526</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
             </se:Stroke>
          </se:LineSymbolizer> 
        </se:Rule> 
          
        
 <se:Rule>
          <se:Name>road condition</se:Name>
          <se:Description>
            <se:Title>road condition Red </se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc"> 
            <ogc:Or> 
          <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>          
            <ogc:Literal>103065376</ogc:Literal>
         </ogc:PropertyIsEqualTo>
         </ogc:Or>
          </ogc:Filter>
         <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#e81414</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
             </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>  
      
        <se:Rule>
          <se:Name>road condition</se:Name>
          <se:Description>
            <se:Title>road condition</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc"> 
            <ogc:Or> 
          <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>          
            <ogc:Literal>103103540</ogc:Literal>
         </ogc:PropertyIsEqualTo>
         </ogc:Or>
          </ogc:Filter>
         <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#e81414</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
             </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule> 
        
        
       <se:Rule>
          <se:Name>road condition</se:Name>
          <se:Description>
            <se:Title>road condition Orange</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc"> 
            <ogc:Or> 
          <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>          
            <ogc:Literal>103066500</ogc:Literal>
         </ogc:PropertyIsEqualTo>
         </ogc:Or>
          </ogc:Filter>
         <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ff8c00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
             </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>  
      
        <se:Rule>
          <se:Name>road condition</se:Name>
          <se:Description>
            <se:Title>road condition</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc"> 
            <ogc:Or> 
          <ogc:PropertyIsEqualTo>
          	<ogc:PropertyName>link_id</ogc:PropertyName>          
            <ogc:Literal>116000812</ogc:Literal>
          </ogc:PropertyIsEqualTo>
              
			<ogc:PropertyIsEqualTo>
          	<ogc:PropertyName>link_id</ogc:PropertyName>          
            <ogc:Literal>116000808</ogc:Literal>
          </ogc:PropertyIsEqualTo>              
  
          <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>          
            <ogc:Literal>103104100</ogc:Literal>
         </ogc:PropertyIsEqualTo>
              
          <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>          
            <ogc:Literal>103066272</ogc:Literal>
         </ogc:PropertyIsEqualTo>              

   <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>          
            <ogc:Literal>103054856</ogc:Literal>
         </ogc:PropertyIsEqualTo>
         
		 <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>          
            <ogc:Literal>103104104</ogc:Literal>
         </ogc:PropertyIsEqualTo>
              
          <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>          
            <ogc:Literal>103066512</ogc:Literal>
         </ogc:PropertyIsEqualTo>
         
		 <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>          
            <ogc:Literal>103066516</ogc:Literal>
         </ogc:PropertyIsEqualTo>              
              
		 <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>          
            <ogc:Literal>103065316</ogc:Literal>
         </ogc:PropertyIsEqualTo>                 

              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>          
            <ogc:Literal>103065308</ogc:Literal>
         </ogc:PropertyIsEqualTo>                 
              
              
         </ogc:Or>
          </ogc:Filter>
         <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ff8c00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
             </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule> 
 



        
        
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
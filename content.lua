function Image(img)
      if img.classes:find('content',1) then
        local f = io.open("myfile/" .. img.src, 'r')
        local doc = pandoc.read(f:read('*a'))
        f:close()
        local addition = pandoc.utils.stringify(doc.meta.addition)
        local student = pandoc.utils.stringify(doc.meta.student)
        local am = pandoc.utils.stringify(doc.meta.am)
        
        local sep = "___________________________________"
        local content = sep .. "\n\n"
        content = content .. ">_" .. addition .. "_\n>"
        content = content .. "\n\n" .. sep .. "\n\n"
	content = content .. "\n\n" .. sep .. "\n\n"
	--The line above is purely for aesthetic purposes
        content = content .. ">" .. student .. "\n\n"
        content = content .. ">" .. am .. " \n>"
        content = content .. "\n\n" .. sep .. "\n\n"
        
        return pandoc.RawInline('markdown',content)
      end
end

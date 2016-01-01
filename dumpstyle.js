function dumpStyle(n)
{
    if(n.nodeType == 1)
    {
        var d =
        {
            tag: n.tagName,
            style: getComputedStyle(n),
            children: [],
        };
        for(var i = 0; i < n.childNodes.length; i++)
        {
            d.children.push(dumpStyle(n.childNodes[i]));
        }
        return d;
    }
    else if(n.nodeType == 3)
    {
        return n.textContent;
    }
    return 'UNKNOWN NODE TYPE';
}

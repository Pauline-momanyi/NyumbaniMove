import React, {useEffect, useState} from 'react'

function Testing() {
    const [test, setTest] = useState('')
    useEffect(()=>{
        fetch('/tests')
        .then(r=>{if (r.ok){
            r.json().then(data=>{
              console.log(data)
              setTest(data.text)
            })
        }else{
          r.json().then(err=>console.log(err))
        }}        
        )
        
    }, [])

  return (
    <div>
        <h4>Testing if the API is connected</h4>
       {test&& <p>{test}</p>}
    </div>
  )
}

export default Testing
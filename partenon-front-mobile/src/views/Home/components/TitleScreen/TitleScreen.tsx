import { Div, Section } from "components/wrappers";
import { Loading, Pagination } from "components/standalone";
import MuseumItem from "../MuseumItem/MuseumItem";
import React, { useState } from "react";
import shortMuseum from "../../models/shortMuseum";
import listOfMuseums from "../../models/listOfMuseums";
import "./TitleScreen.css";
import parthenon from "assets/parthenon.jpg";
import getMuseums from "../../services/getMuseums";

import { getDummyListOfMuseums } from "dummy";
import { useEffect } from "react";


export default function TitleScreen(): JSX.Element {

  const [museums,     setMuseums]: [shortMuseum[], React.Dispatch<React.SetStateAction<shortMuseum[]>>]
  = useState();
  const [totalPages,  setTotalPages] =  useState(2);
  const [last,        setLast] =        useState(false);

  const [q,           setQ] =           useState('');
  const [page,        setPage] =        useState(0);
  const [loading,     setLoading] =     useState(false);
 
  useEffect(search, [page])

  function search() {
    setLoading(true);

    console.log(page);
    console.log(last);
    const dummyResponse = new Promise(resolve => setTimeout(()=>resolve(getDummyListOfMuseums(page)), 1000));

    dummyResponse.then((dummyList: listOfMuseums)=>{
      setMuseums    (dummyList.museums);
      setLast       (dummyList.last);
      setLoading    (false);
    })
    

    getMuseums(q, page).then(response=>{
      if (!response?.ok) return;
      const listOfMuseums: listOfMuseums = response.content;

      setMuseums    (listOfMuseums.museums);
      setTotalPages (listOfMuseums.totalPages);
      setLast       (listOfMuseums.last);
      setLoading    (false);
    });
  }

  return (
    <div className="title-wrapper">
      <h1>Partenón</h1>

      <Section label="">
        <form onSubmit={(e)=>{e.preventDefault();search()}}>

          <label htmlFor="q">Busca un museo por nombre (necesita servidor)</label>
          <input id="q" type="search" placeholder="encuentra un museo..." value={q} onChange={q=>setQ(q.target.value)} />

          <Pagination page={page} setPage={setPage} totalPages={totalPages} last={last} />

          <Div cond={loading}><Loading /></Div>

          {museums?.length > 0 ? 

            <Div flex className="list-of-museums">
            {museums.map((museum, i) => <MuseumItem  museum={museum} key={i} />)}
            </Div>

            :

            <img src={parthenon} alt="" />
          }

        </form>

      </Section>
    </div>
  );
}